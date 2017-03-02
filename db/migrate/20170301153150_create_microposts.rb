class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :original_micropost_id
      t.integer :original_user_id
      t.string :genre
      t.string :image1
      t.string :image2
      t.string :image3
      t.text :content

      t.timestamps null: false
      t.index [:user_id, :created_at]
    end
  end
end
