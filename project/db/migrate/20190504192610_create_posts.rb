class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.boolean :open
      t.string :location
      t.boolean :solved
      t.datetime :date

      t.timestamps
    end
  end
end
