class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :client, index: true, foreign_key: true
      t.string :type
      t.string :businessname
      t.integer :category
      t.string :firstname
      t.string :lastname
      t.integer :age


      t.timestamps null: false
    end
  end
end
