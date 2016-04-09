require './store_product'
require './store_category'

class Inventory
  def initialize
    @categories = []
    whiskey_products = [
      Product.new( "Blue Labe", "Keep walking Johnnie", 40.0, 20),
      Product.new( "Lagavulin", "Ron Swanson's favorite", 56.0, 15)]
    @categories << Category.new( "Whiskey", whiskey_products)

    rum_products = [
      Product.new("Tres Hombres", "Made by Bro's", 36.0, 20),
      Product.new("Caroni 1974", "I make the hearts of men weak", 250.0, 5)]
    @categories << Category.new( "Rum", rum_products)

    tequila_products = [
      Product.new("Ocho", "No Ocho No Fiesta", 32.0, 20),
      Product.new("Sauza", "I make you puke your guts out, and leave you with a massive hangover", 0, 30)]
    @categories << Category.new( "Tequila", tequila_products)

  end

  def get_product product_name
    @categories.each do |category|
      category.product.each do |product|
        if product.name == product_name
          return product
        end
      end
    end
   "Oh noes, its not here! o.0"
  end

  def list
    @categories.each do |category|
      puts category.name
      category.product.each do |product|
        puts "-- #{product.name}"
      end
    end
  end
end
