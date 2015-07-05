class AddAccountIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :account_id, :string
    remove_column :messages, :body, :string
  end
end
