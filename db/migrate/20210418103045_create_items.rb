class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :genre_id, :null => false
      t.string :name, :null => false
      t.string :description, :null => false
      t.string :image_id
      t.integer :price, :null => false
      t.boolean :is_selling, :null => false, default: false

      t.timestamps
    end

    add_index :items, :name,                unique: true
  end
end
