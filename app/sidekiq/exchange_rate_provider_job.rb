# frozen_string_literal: true

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
      data.each(&:save!)
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
        if entry.currency == old_entry.currency && entry.value != old_entry.value
          old_entry.value = entry.value
          old_entry.save!
          found = true
          break
        end

        entry.save! unless found
      end
    end
  end
end
