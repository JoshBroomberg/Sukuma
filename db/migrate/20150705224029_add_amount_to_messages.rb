class AddAmountToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :amount, :float
  end
end
