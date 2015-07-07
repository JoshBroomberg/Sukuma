class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :type

      t.timestamps null: false
    end
  end
end
