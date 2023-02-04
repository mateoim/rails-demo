# frozen_string_literal: true

class ExchangeRateProviderListJob
  include Sidekiq::Job

  def perform
    ExchangeRateProvider.all.each do |provider|
      ExchangeRateProviderJob.perform_async provider.id
    end
  end
end
