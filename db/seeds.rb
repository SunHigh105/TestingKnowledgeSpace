# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
range = 1..5

range.each do |n|
    User.create!(
        name: "ユーザー#{n}",
        email: "user_#{n}@test.co.jp",
        password: "password_#{n}",
        password_confirmation: "password_#{n}"
    )
    Article.create!(
        title: "タイトル#{n}",
        content: "この記事は#{n}番目の記事です",
        image: "image_01.jpg",
        user_id: n
    )
end