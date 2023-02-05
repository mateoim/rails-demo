# frozen_string_literal: true

# A Sidekiq Job that fetches the data for the given ExchangeRateProvider for the current day. If entries already exist
# for the current day, it will update entries with changes and save missing ones if there are any.
class ExchangeRateProviderJob
  include Sidekiq::Job

  def perform(provider_id)
    provider = ExchangeRateProvider.find(provider_id)
    data = provider.fetch_data

    return if data.empty?

    date = data.first&.published_at
    existing_records = provider.exchange_rates.published_at(date)

    # if no records exist for this date, save them
    if existing_records.empty?
      ExchangeRate.insert_all!(data.map { |n| n.attributes.compact })
      return
    end

    # check if existing records have changed and update them or save new ones
    update_exchange_rates(data, existing_records)
  end

  private

  def update_exchange_rates(new_exchange_rates, old_exchange_rates)
    new_exchange_rates.each do |entry|
      found = false
      old_exchange_rates.each do |old_entry|
        next unless entry.currency == old_entry.currency

        found = true

        break if entry.value == old_entry.value

        old_entry.value = entry.value
        old_entry.save!
        break
      end

      next if found

      entry.save!
    end
  end
end
