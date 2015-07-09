class CreateTipCategories < ActiveRecord::Migration
  def change
    create_table :tip_categories do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
