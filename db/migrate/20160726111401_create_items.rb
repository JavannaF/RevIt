class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :avg_price
      t.float :avg_rating
      t.text :description
      t.references :user , index: true

      t.timestamps null: false
    end
    add_index :items, [:user_id, :created_at]
  end
end
