class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :avg_price
      t.float :avg_rating
      t.text :description

      t.timestamps null: false
    end
  end
end
