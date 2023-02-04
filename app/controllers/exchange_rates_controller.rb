# frozen_string_literal: true

class ExchangeRatesController < ApplicationController
  before_action :set_exchange_rate, only: [:show]
  before_action :set_exchange_rate_provider

  # GET /exchange_rates or /exchange_rates.json
  def index
    @exchange_rates = get_exchange_rates params[:date]
  end

  # GET /exchange_rates/1 or /exchange_rates/1.json
  def show
    if @exchange_rate.exchange_rate_provider_id.to_s != params[:exchange_rate_provider_id]
      render file: "#{Rails.root}/public/404.html", layout: false
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

  def get_exchange_rates(date = nil)
    date = @exchange_rate_provider.exchange_rates.order('published_at DESC').first&.published_at if date.nil?

    return [] if date.nil? # if date is still nil, there are no entries and the method can exit

    @exchange_rate_provider.exchange_rates.published_at(date)
  end

end
