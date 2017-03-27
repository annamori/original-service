class AddProfileToUsers < ActiveRecord::Migration
  def change
    #add_column :users, :location, :string
    add_column :users, :introduction, :text
    add_column :users, :age, :integer
    add_column :users, :gender, :string
  end
end
