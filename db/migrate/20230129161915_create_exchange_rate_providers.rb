class CreateExchangeRateProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :exchange_rate_providers do |t|
      t.string :name
      t.string :type
      t.string :source_currency
      t.string :source_url

      t.timestamps
    end
  end
end
