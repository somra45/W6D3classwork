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

a1 = Artwork.create!(title: 'matcha latte', artist: u1, image_url: "https://www.sunglowkitchen.com/wp-content/uploads/2022/07/oat-milk-matcha-latte-1-500x500.jpg")
a2 = Artwork.create!(title: 'broccoli', artist: u2, image_url: "https://storage.googleapis.com/images-bks-prd-1385851.bks.prd.v8.commerce.mi9cloud.com/product-images/detail/43e1c071-3fc4-460a-a239-5fd3eaa1c0ce.jpeg")
a3 = Artwork.create!(title: 'harvey sandwhich', artist: u3, image_url: "https://images.squarespace-cdn.com/content/v1/5df300cc0d6bf521e6076d3b/1648618377912-UHQ7E87OZV8031CWDDNV/Harveys+Sandwich+-+Salad+%282%29.jpg")

s1 = ArtworkShare.create!(viewer: u1, artwork: a2)
s2 = ArtworkShare.create!(viewer: u1, artwork: a3)
s3 = ArtworkShare.create!(viewer: u2, artwork: a3)