class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :academic_degree
      t.string :lattes
      t.string :avatar_img
      t.boolean :member, default: true

      t.timestamps
    end
  end
end
