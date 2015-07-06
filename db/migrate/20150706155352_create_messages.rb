class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :client, index: true, foreign_key: true
      t.integer :kind
      t.boolean :confirm
      t.string :account_id
      t.float :amount

      t.timestamps null: false
    end
  end
end
