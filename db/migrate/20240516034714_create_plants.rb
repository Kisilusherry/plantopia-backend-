class CreatePlants < ActiveRecord::Migration[7.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.decimal :price
      t.string :climate
      t.text :description
      t.string :image
      t.text :additional_info

      t.timestamps
    end
  end
end
