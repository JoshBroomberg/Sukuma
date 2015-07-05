class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :messagable, polymorphic: true, index: true
      t.string :account_id
      t.float :amount
      t.string :category
      t.boolean :closed

      t.timestamps null: false
    end
  end
end
