class CreatePublications < ActiveRecord::Migration[7.0]
  def change
    create_table :publications do |t|
      t.string :title
      t.integer :year
      t.text :abstract
      t.string :theme
      t.string :category

      t.timestamps
    end
  end
end
