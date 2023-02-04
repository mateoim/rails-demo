class AddIndexToExchangeRates < ActiveRecord::Migration[7.0]
  def change
    add_index :exchange_rates, :published_at
    add_index :exchange_rates, :currency
  end
end
