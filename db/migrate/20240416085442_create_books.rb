class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year
      t.text :abstract
      t.string :cover_img

      t.timestamps
    end
  end
end
