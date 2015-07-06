class AddNumberToClients < ActiveRecord::Migration
  def change
    add_column :clients, :number, :string
  end
end
