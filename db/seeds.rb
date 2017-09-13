# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Seeding Admins"

    user2 = User.create(email: "admin@utilant.com", password: "admin" , password_confirmation: "admin" )
    user2.add_role :admin

    user1 = User.create(email: "mdavidoconnor@gmail.com", password: "matthew123", password_confirmation: "matthew123")
    user1.add_role :admin






