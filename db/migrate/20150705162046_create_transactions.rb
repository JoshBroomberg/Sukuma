class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :vendor, index: true, foreign_key: true
      t.float :amount
      t.string :state
      t.string :category

      t.timestamps null: false
    end
  end
end
