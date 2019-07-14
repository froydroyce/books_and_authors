# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Author.destroy_all
Book.destroy_all
@paolo = Author.create!(name: "Paulo Coelho")
@louis = Author.create!(name: "Louis Sachar")
@the_alchemist = Book.create!(title: "The Alchemist", publication_year: 1988, number_of_pages: 208)
@holes = Book.create!(title: "Holes", publication_year: 1998, number_of_pages: 265)
@small_steps = Book.create!(title: "Small Steps", publication_year: 2006, number_of_pages: 257)
@paolo.books << [@the_alchemist, @holes]
@louis.books << [@holes, @small_steps]
