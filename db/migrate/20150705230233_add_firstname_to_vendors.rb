class AddFirstnameToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :firstname, :string
  end
end
