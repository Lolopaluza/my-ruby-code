require './contacts_file'


def index( contacts )
  contacts.each_with_index do |contact, i|
    puts "#{i + 1}) #{contact[:name]}"
  end
end

def show ( contact )
  puts "#{contact[:name]}"
  puts "phone: #{contact[:phone]}"
  puts "email: #{contact[:email]}"
end

def ask ( prompt )
  print prompt
  gets.chomp
end

def search ( contact, i )
  read_contacts
  search_contact = gets.chomp
  for @contacts.each.match(search_contact)
    do return contact
  end
end

def create_new
  contact = {}

  puts
  puts "Enter contact info:"

  contact [:name] = ask "Name?"
  contact [:phone] = ask "Phone?"
  contact [:email] = ask "Email?"
end

def action_new( contacts )
  contact = create_new

  contacts << contact

  write_contacts( contacts )

  puts
  puts "New contact created:"
  puts

  show ( contact )
  puts
end

def action_show( contacts, i )
    contact = contacts[i-1]

    puts
    show( contact )
    puts
end

def action_delete( contacts )
  puts
  response = ask "Delete which contact? "

  i = response.to_i

  puts
  puts "Contact for #{contacts[i-1][:name]} deleted."

  contacts.delete_at ( i-1 )

  write_contacts( contacts )
  puts
end

def action_error
  puts
  puts "Sorry, I don't recognize that command."
  puts
end

def action_search( contacts )
  puts
  pattern = ask "Search for? "
  puts

  contacts.eacg do |contact|
    if contact[:name] =~ /\b#{pattern}/i
      show( contact )
      puts
    end
  end
end


loop do
  contacts = read_contacts

  index ( contacts )

  puts
  response = ask "Who would you like to see?
  (n for new, s for search, d for delete, q to quit)"

  break if response == "q"

  if response == "n"
    action_new ( contacts )
  elsif response == "d"
    action_delete( contacts )
  elsif response =~ /[0-9]+/
    action_show( contacts, response.to_i )
  elsif resonse == "s"
    action_search( contacts )
  else
    action_error
  end
end

puts
puts "Bye!"
