class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.integer :age
      t.string :occupation
      t.text :content
      t.string :image
      t.string :location

      t.timestamps
    end
  end
end
