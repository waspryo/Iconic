class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :name
      t.integer :age
      t.string :occupation
      t.text :content
      t.string :image
      t.string :outer
      t.string :トップス
      t.string :ボトムス
      t.string :バッグ
      t.string :アクセサリー
      t.string :location
      t.string :comment

      t.timestamps
    end
  end
end
