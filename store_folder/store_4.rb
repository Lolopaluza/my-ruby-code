@shopping_cart = []
@categories = [ :whisky, :rum, :tequila, :mezcal ]

@products = {
  :whisky => [
    { :reference_number => 1234, :name => "jack Daniels", :price => 19.0, :quantity => 15},
    { :reference_number => 1235, :name => "lagavulin", :price => 58.0, :quantity => 4},
  ],
  :rum => [
    { :reference_number => 1234, :name => "tres Hombres", :price => 45.0, :quantity => 7},
    { :reference_number => 1234, :name => "caroni 1974", :price => 250.0, :quantity => 3},
  ],
  :tequila => [
    { :reference_number => 1236, :name => "ocho", :price => 28.0, :quantity => 6},
    { :reference_number => 1236, :name => "sauza", :price => 0.5, :quantity => 14},
  ],
  :mezcal => [
    { :reference_number => 1237, :name => "illegal", :price => 36.0, :quantity => 8},
    { :reference_number => 1237, :name => "agave de Cortez", :price => 27.0, :quantity => 10},
  ]
}

def select_category
  sleep 2
  puts "Check out our rare liqours:"

  @categories.each do |category|
    puts "#{category.to_s}"
  end

  puts "-" * 40
  puts "Please select one by its name:"
  category = gets.chomp
end

def show_products(category)
  puts "-" * 40

  category = category.to_sym
  products = @products[category]

  products.each do |product|
    puts "Reference nr.: #{product[:reference_number]}"
    puts "Product: #{product[:name]}"
    puts "Price: #{product[:price]} EUR"
    puts "quantity: #{product[:quantity]}"
    puts "-" * 40
  end

products
end


def choose_reference_number
puts "Select item to buy by its reference_number:"
gets.chomp
end

def add_product_to_card(products, reference_number)
while true
  product = look_up_product(products, reference_number)
  if product != nil
    @shopping_cart << product
    puts "Congratulations. '#{product[:name]}' has been added to the cart!"
    break
  else
    puts "I don't think you selected a valid reference_number. Try again:"
  end
end
end

def look_up_product(products, reference_number)
products.each do |product|
  if product[:reference_number] == reference_number.to_i
    return product
  end
end

nil
end

def print_cart
puts "*" * 40
puts "CURRENT SHOPPING CART"
puts "*" * 40
@shopping_cart.each do |product|
  puts "Reference nr.: #{product[:reference_number]}"
  puts "Product: #{product[:name]}"
  puts "Price: #{product[:price]} EUR"
  puts "Quantity: #{product[:quantity]}"
  puts "-" * 40
end

@shopping_cart
end

puts "Welcome to terminals liqour shop, because you need it"

category = select_category
products = show_products(category)
reference_number = choose_reference_number
add_product_to_card(products, reference_number)
print_cart
