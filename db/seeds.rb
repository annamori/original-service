# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name: "anna", email: "anna0129@gmail.com", password: "anna0129")

29.times {|n| User.create!(name: "test#{n}", email: "test#{n}@gmail.com", password: "password") }

genres = ["チケット", "その他"]
5.times do |n|
  5.times do
    Micropost.create!(user_id: n + 1, genre: genres.sample, content: [*"a".."z"].sample(20).join)
  end
end