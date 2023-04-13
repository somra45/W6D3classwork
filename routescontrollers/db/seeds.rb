# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all

u1 = User.create!(username: 'Mohammad')
u2 = User.create!(username: 'Tyvan the Terrible')
u3 = User.create!(username: 'Harvey')

a1 = Artwork.create!(title: 'matcha latte', )

