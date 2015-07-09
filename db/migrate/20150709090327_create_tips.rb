class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.references :tip_category, index: true, foreign_key: true
      t.string :summary
      t.text :body

      t.timestamps null: false
    end
  end
end
