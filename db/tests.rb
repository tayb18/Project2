require_relative "db_config"

user = User.create({name: "Mildred" })
puts user.name == "Mildred"

a1 = Article.create({
  title: "Mil is Vicious", 
  content: "Mil is really vicious. She made me bleed. But I still love her",
  user_id: user.id})
a2 = Article.create({
  title: "Rafiqi's", 
  content: "Rafiqi's is amazing.",
  user_id: user.id})
puts a1.title == "Mil is Vicious"

puts a1.user.name == "Mildred"

category1 = Category.create({
  name: "Delicious"
  })

category2 = Category.create({
  name: "Belly ache"
  })

# trying to add an article to a category
category1.articles.push(a2)
puts a2.categories[0].name == "Delicious"

