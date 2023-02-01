class CreateExchangeRates < ActiveRecord::Migration[7.0]
  def change
    create_table :exchange_rates do |t|
      t.string :currency, null: false
      t.integer :amount, null: false
      t.float :value, null: false
      t.date :published_at, null: false
      t.references :exchange_rate_provider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
