# frozen_string_literal: true

class ExchangeRateProvidersController < ApplicationController
  before_action :set_exchange_rate_provider, only: %i[ show ]

  # GET /exchange_rate_providers or /exchange_rate_providers.json
  def index
    @exchange_rate_providers = ExchangeRateProvider.all
  end

  # GET /exchange_rate_providers/1 or /exchange_rate_providers/1.json
  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_exchange_rate_provider
    @exchange_rate_provider = ExchangeRateProvider.find(params[:id])
  end

end
