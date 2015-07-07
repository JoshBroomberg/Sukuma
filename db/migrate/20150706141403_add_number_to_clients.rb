class AddNumberToClients < ActiveRecord::Migration
  def change
    add_column :clients, :number, :string
    remove_column :clients, :email, :string
  end
end
