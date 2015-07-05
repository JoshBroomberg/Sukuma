class AddNumberToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :number, :string
  end
end
