#  load this in the terminal after you do the schema loading stuff using this
#  ruby db/seeds.rb
#  then you can open the foodnetwork db in the terminal like so
#  in db file 'sqlite3 foodnetwork.sqlite3'
#  then select * from table

require_relative "db_config"

categories = [
  {name: "Competition"},
  {name: "Exposition"}
]
Category.create(categories)


users = [
  {name: "Taylor Basso", username: "Tayb18"},
  {name: "Joseph Smith", username: "JesusIsMyHomeBoi"}
]
User.create(users)


articles = [
  {title: "Cut Throat Kitchen: Like Someone Pooped in My Cereal", content: "Kittens kittens pigeon pigeon pop app, puppy pegasus surprise surprise. Rainbows kittens rainbows rainbows pony delight, app wereunicorn puppy puppy. Pigeon pop pigeon, pop pigeon wereunicorn pony pegasus social pop pop pony. Surprise unicorn rainbows pigeon puppy pegasus pegasus pigeon delight. Pop pony surprise pegasus puppy social pop, pegasus app puppy wereunicorn pop.

    Social pop delight rainbows puppy, pegasus rainbows rainbows wereunicorn rainbows wereunicorn puppy pony rainbows. Surprise unicorn app, pigeon unicorn delight delight pegasus wereunicorn wereunicorn unicorn unicorn. Pony social pop unicorn puppy pegasus pop rainbows delight unicorn, pegasus rainbows unicorn surprise. App pigeon social surprise kittens, social pegasus app kittens unicorn. Unicorn pegasus kittens pegasus, rainbows surprise pop rainbows rainbows puppy.

    Surprise unicorn unicorn pegasus pegasus surprise kittens wereunicorn wereunicorn, unicorn social pony pegasus. Pegasus pigeon app pop pop pigeon, puppy surprise social pegasus app puppy. Social pony puppy social, pegasus pegasus rainbows rainbows surprise social. Wereunicorn unicorn rainbows kittens delight delight pony, wereunicorn rainbows app delight rainbows. Wereunicorn wereunicorn pop puppy social kittens, pony social unicorn surprise kittens kittens.", 
    date_created: "December 2nd, 2015", date_edited: nil}
]
Article.create(articles)


images = [
  {name: "cutthroat", img_url: "http://foodnetwork.sndimg.com/content/dam/images/food/fullset/2014/4/30/0/KT0208_Chef-Perez-Warped-Pan.jpg.rend.snigalleryslide.jpeg", article_id: 1}
]
Image.create(images)


articles_users = [
  {article_id: 1, user_is: 1}
]
Article_User.create(articles_users)


articles_categories = [
  {article_id: 1, category_id: 1}
]
Article_Category.create(articles_categories)
