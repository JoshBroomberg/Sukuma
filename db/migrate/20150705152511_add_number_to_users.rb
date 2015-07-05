class AddNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :number, :string
    add_index :users, :number, unique: true
  end
end
