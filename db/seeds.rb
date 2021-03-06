require 'json'
require 'open-uri'

puts "Deleting existing db"
Ingredient.destroy_all

puts "Looking at API"
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

puts "Creating ingredients"
ingredients["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end
puts "Ingredients created!"
