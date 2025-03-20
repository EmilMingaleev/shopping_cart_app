puts "Seeding Cart"

Cart.find_or_create_by!(discount: 100)

puts "Cart seeded!"
