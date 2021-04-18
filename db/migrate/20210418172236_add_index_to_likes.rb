class AddIndexToLikes < ActiveRecord::Migration[6.1]
  def change
    add_index :likes, :fan
    add_index :likes, :photo
  end
end
