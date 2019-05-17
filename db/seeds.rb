# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# seeding database
require 'json'
require 'open-uri'

puts 'Cleaning Cocktails database...'
Cocktail.destroy_all
puts 'Cleaning Doses database...'
Dose.destroy_all
puts 'Cleaning Ingredients database...'
Ingredient.destroy_all

puts 'Creating Ingredients...'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
result = JSON.parse(open(url).read)
result["drinks"].each { |drink| Ingredient.create(name: drink["strIngredient1"]) }

# puts 'Creating Cocktails...'
# url = 'https://raw.githubusercontent.com/teijo/iba-cocktails/master/recipes.json'
# result = JSON.parse(open(url).read)
# result.each do |cocktail|
#   one = Cocktail.create(name: cocktail['name'])
#   cocktail['ingredients'].each do |item|
#     ing = Ingredient.find_by(name: item['ingredient'])
#     if ing.nil?
#       ing = Ingredient.create(name: item['ingredient'])
#     end
#     dose = Dose.create(description: "#{item['amount']} #{item['unit']}")
#     dose.cocktail = one
#     dose.ingredient = ing
#     dose.save
#   end
# end

puts 'Finished!'
