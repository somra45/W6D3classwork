# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
u1 = User.create!(name: 'Mohammad', email: 'unique_mom@idiot.com')
u2 = User.create!(name: 'Tyvan the Terrible', email: 'big_shitter@gmail.com')
u3 = User.create!(name: 'Harvey', email: 'small_shitter@gmail.com')