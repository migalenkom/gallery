class CreateImageGalleries < ActiveRecord::Migration
  def change
    create_table :image_galleries do |t|
      t.integer :cover_id
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
