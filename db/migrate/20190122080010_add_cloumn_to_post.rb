class AddCloumnToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :アウター, :string
    add_column :posts, :トップス, :string
    add_column :posts, :ボトムス, :string
    add_column :posts, :バッグ, :string
    add_column :posts, :アクセサリー, :string
    add_column :posts, :comment, :text
  end
end
