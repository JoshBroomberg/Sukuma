class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :accountable, polymorphic: true, index: true
      t.float :balance
      t.string :account_id
      t.integer :pin

      t.timestamps null: false
    end
  end
end
