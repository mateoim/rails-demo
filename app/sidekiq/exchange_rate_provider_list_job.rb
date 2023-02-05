# frozen_string_literal: true

# A Sidekiq Job that enqueues an ExchangeRateProviderJob for every ExchangeRateProvider.
class ExchangeRateProviderListJob
  include Sidekiq::Job

  def perform
    ExchangeRateProvider.all.each do |provider|
      ExchangeRateProviderJob.perform_async provider.id
    end
  end
end
