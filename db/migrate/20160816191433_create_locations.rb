class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :dataset_id
      t.string :title
      t.text :description
      t.string :geo_long
      t.string :geo_lat
      t.string :image
      t.string :registered_date
      t.string :subject
      t.string :source
      t.text :address
      t.string :tel
      t.text :url

      t.timestamps
    end
  end
end
