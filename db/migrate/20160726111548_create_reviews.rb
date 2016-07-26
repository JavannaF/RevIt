class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :user
      t.text :comment
      t.float :price
      t.float :rating
      t.string :store
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
