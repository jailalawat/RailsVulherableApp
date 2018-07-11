# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Article.create(title: "Hello World", text: "Content of our first post <script>alert(1)</script>", web_url: "javascript:alert(document.domain)")
User.create(full_name: "Jai lalawat", email: "jailalawat@gmail.com", password: "12345678")
