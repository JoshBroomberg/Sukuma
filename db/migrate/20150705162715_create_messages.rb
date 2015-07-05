class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :messagable, polymorphic: true, index: true
      t.string :body
      t.string :type
      t.boolean :closed

      t.timestamps null: false
    end
  end
end
