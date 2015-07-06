class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :customer_id
      t.integer :vendor_id
      t.float :amount
      t.integer :state
      t.integer :kind

      t.timestamps null: false
    end
  end
end
