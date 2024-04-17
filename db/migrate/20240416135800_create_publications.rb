class CreatePublications < ActiveRecord::Migration[7.0]
  def change
    create_table :publications do |t|
      t.string :title
      t.integer :year
      t.text :abstract
      t.string :theme
      t.string :publication_type
      t.string :cover_img

      t.timestamps
    end
  end
end
