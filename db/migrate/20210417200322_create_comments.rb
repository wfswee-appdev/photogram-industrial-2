class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }, index: true
      t.references :photo, null: false, foreign_key: { to_table: :photos }
      t.text :body

      t.timestamps
    end
  end
end
