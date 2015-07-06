class AddConfirmToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :confirm, :boolean
  end
end
