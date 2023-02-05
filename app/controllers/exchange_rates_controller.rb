# frozen_string_literal: true

# Controller class for ExchangeRates. It can provide a simple HTML GUI or serve as an API by providing data in JSON
# format.
class ExchangeRatesController < ApplicationController
  before_action :set_exchange_rate, only: [:show]
  before_action :set_exchange_rate_provider

  # GET /exchange_rates or /exchange_rates.json
  # Optional query parameters:
  # date - date for which to fetch the exchange rates, if none is specified fetch the latest exchange rates.
  # currencies - a comma separated list of currency codes to fetch. If a currency is missing, it is ignored.
  def index
    @exchange_rates = get_exchange_rates(params[:date], params[:currencies])
  end

  # GET /exchange_rates/1 or /exchange_rates/1.json
  def show
    if @exchange_rate.exchange_rate_provider_id.to_s != params[:exchange_rate_provider_id]
      render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
      return
    end

    @exchange_rate
  end

  private

  def set_exchange_rate
    @exchange_rate = ExchangeRate.find(params[:id])
  end

  def set_exchange_rate_provider
    @exchange_rate_provider = ExchangeRateProvider.find(params[:exchange_rate_provider_id])
  end

  def get_exchange_rates(date = nil, currencies = nil)
    @date = calculate_date(date)

    if @date.nil?
      @date = Date.today
      fetch_data
    end

    data = @exchange_rate_provider.exchange_rates.published_at(@date)

    if data.empty?
      fetch_data
      data = @exchange_rate_provider.exchange_rates.published_at(@date)
    end

    data = data.currency(currencies.split(/,/).map(&:upcase)) unless currencies.nil?

    data
  end

  def calculate_date(date)
    date = Date.parse date unless date.nil?
    date = @exchange_rate_provider.exchange_rates.order('published_at DESC').first&.published_at if date.nil?

    return if date.nil?

    return date.prev_occurring(:friday) if date.on_weekend?

    date
  end

  def fetch_data
    data = @exchange_rate_provider.fetch_data @date

    return if data.empty?

    @date = data.first.published_at

    existing = @exchange_rate_provider.exchange_rates.published_at(@date)

    return unless existing.empty?

    ExchangeRate.insert_all!(data.map { |n| n.attributes.compact })
  end
end
