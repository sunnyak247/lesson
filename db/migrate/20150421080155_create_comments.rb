class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.string :author
      t.text :content
      t.integer :rating
      t.references :movie, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :movies
  end
end
