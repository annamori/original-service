class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :micropost, index: true, foreign_key: true
      t.text :text
      t.string :image

      t.timestamps null: false
    end
  end
end
