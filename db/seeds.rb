# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

user = User.create(email: 'oscaryih@hotmail.com', password: 'abc123')
user = User.create(email: 'test@test.com', password: 'abc123')
user = User.create(email: 'test2@test.com', password: 'abc123')
user = User.create(email: 'test3@test.com', password: 'abc123')
user = User.create(email: 'test4@test.com', password: 'abc123')
