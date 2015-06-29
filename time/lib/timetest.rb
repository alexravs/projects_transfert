food_prices = { "banana" => 1,
                "chicken" => 5,
                "rice" => 2,
                "burger" => 8,
                "tomato" => 6
              }

email_adresses = { 
  "Alex" => "ravet@gmail.com",
  "nico" => "clad_cool@hotmail.com",
  "booba" => "jamaisfini@caramel.fr",
  "jery" => "the_legend@lol.be",
  "jeremy" => "skylz@gmail.fr"
  
  }

puts email_adresses.include?("Alex")
puts email_adresses.invert()
puts email_adresses.keys
puts email_adresses.length()
puts email_adresses.merge(food_prices)