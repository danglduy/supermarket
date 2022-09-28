# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

products_data = [
  {sku: "A", unit_price: 50},
  {sku: "B", unit_price: 30},
  {sku: "C", unit_price: 20},
  {sku: "D", unit_price: 15}
]

Product.upsert_all(products_data)
