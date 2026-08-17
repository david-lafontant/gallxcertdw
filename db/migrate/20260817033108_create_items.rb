class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.decimal :price, null: false, precision: 10, scale: 2
      t.references :user, null: false, foreign_key: true
      t.check_constraint "price >= 0", name: "price_non_negative"
      t.timestamps
    end
  end
end
