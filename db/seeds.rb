# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  user1 = User.create!(
     name: 'ak',
     email: 'aktesttest@gga.com',
     password: 'testtest',
     password_confirmation: 'testtest',
     profile: 'test',
     image: 'NO-IMAGE.PNG',
  )
  user2 = User.create!(
    name: 'taro',
    email: 'taro@gga.com',
    password: 'testtest',
    password_confirmation: 'testtest',
    profile: 'test',
    image: 'NO-IMAGE.PNG',
  )
  user3 = User.create!(
    name: 'bobu',
    email: 'bobu@gga.com',
    password: 'testtest',
    password_confirmation: 'testtest',
    profile: 'test',
    image: 'NO-IMAGE.PNG',
  )
  user4 = User.create!(
    name: 'popo',
    email: 'popo@gga.com',
    password: 'testtest',
    password_confirmation: 'testtest',
    profile: 'test',
    image: 'NO-IMAGE.PNG',
  )
  user5 = User.create!(
    name: 'bibi',
    email: 'bibi@gga.com',
    password: 'testtest',
    password_confirmation: 'testtest',
    profile: 'test',
    image: 'NO-IMAGE.PNG',
  )

  article1 = Article.create!(
    title: "Route66",
    content: "midpoint",
    image: open("./app/assets/images/IMG_7835.jpg"),
    user_id: user1.id,
    country: "アメリカ",
    address: "Midway Point of Route 66",
  )

  article2 = Article.create!(
    title: "キューバ",
    content: "キューバ",
    image: open("./app/assets/images/IMG_7835.jpg"),
    user_id: user2.id,
    country: "キューバ",
    address: "habana",
  )

  article3 = Article.create!(
    title: "ウユニ塩湖",
    content: "塩湖",
    image: open("./app/assets/images/Uyuni.JPG"),
    user_id: user3.id,
    country: "ボリビア",
    address: "Uyuni",
  )

  article4 = Article.create!(
    title: "イースター島",
    content: "モアイ像",
    image: open("./app/assets/images/Moai.jpg"),
    user_id: user4.id,
    country: "チリ",
    address: "イースター島",
  )

  article5 = Article.create!(
    title: "マチュ・ピチュ",
    content: "遺跡",
    image: open("./app/assets/images/IMG_8177.jpg"),
    user_id: user5.id,
    country: "ペルー",
    address: "マチュ・ピチュ",
  )
  Favorite.create!(
    user_id: user1.id,
    article_id: article2.id,
  )
  Favorite.create!(
    user_id: user2.id,
    article_id: article5.id,
  )
  Favorite.create!(
    user_id: user3.id,
    article_id: article1.id,
  )
  Favorite.create!(
    user_id: user4.id,
    article_id: article3.id,
  )
  Favorite.create!(
    user_id: user5.id,
    article_id: article4.id,
  )