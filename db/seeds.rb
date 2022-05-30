# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username:"German", password: "password")
User.create(username:"Julian", password: "julianpassword")
User.create(username:"Adrian", password: "adrianpassword")
User.create(username:"Julieta", password: "julietapassword")
User.create(username:"Berta", password: "bertapassword")

Message.create(words: "Hello, how are you?", user_id: 1)
Message.create(words: "Cool, thanks. And you?", user_id: 2)
Message.create(words: "Awesome, I´m fine too, trying to create a chat application", user_id: 1)
Message.create(words: "Sweet. Just let me look up at it when you finish", user_id: 2)
Message.create(words: "Of course!", user_id: 1)