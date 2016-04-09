@cart = []

@categories = [ :mats, :props, :clothes, :books ]

@products = {
  :mats => [
    { :reference_number => 1234, :name => "Mat 1", :price => 10 },
    { :reference_number => 1235, :name => "Mat 2", :price => 20 },
  ],
  :props => [
    { :reference_number => 1234, :name => "Block", :price => 30 },
    { :reference_number => 1234, :name => "Meditation cushion", :price => 30 },
  ],
  :clothes => [
    { :reference_number => 1236, :name => "The best T-shirt", :price => 200 },
    { :reference_number => 1236, :name => "The cutest yoga pants", :price => 300 },
  ],
  :books => [
    { :reference_number => 1237, :name => "Bring Yoga To Life", :price => 30 },
    { :reference_number => 1237, :name => "Light On Yoga", :price => 10 },
  ]
}

def select_category
  puts "Check out our departments:"

  @categories.each do |category|
    puts "#{category.to_s}"
  end

  puts "-" * 40
  puts "Please select one by its name:"
  gets.chomp
end

def show_products(category)
  category = category.to_sym

  @products[category].each do |product|
    puts "Reference nr.: #{product[:reference_number]}"
    puts "Product: #{product[:name]}"
    puts "Price: #{product[:price]} EUR"
    puts "-" * 40
  end
end

puts "Welcome to the Yoga Shop!"
category = select_category
puts "*" * 40
show_products(category)
