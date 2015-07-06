class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :client, index: true, foreign_key: true
      t.float :balance
      t.string :account_id
      t.string :pin

      t.timestamps null: false
    end
  end
end
