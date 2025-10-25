class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount, precision: 10, scale: 2
      t.string :currency
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
