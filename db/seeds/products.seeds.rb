after "carts" do
  puts "Seeding Products"

  products_data = [
    { name: "Беспроводная колонка Goodyear Bluetooth Speaker", price: 1600 },
    { name: "Женский домашний костюм Sweet Dreams", price: 800 },
    { name: "Плащ-дождевик SwissOak", price: 400 }
  ]

  products_data.each do |data|
    Product.find_or_create_by!(name: data[:name]) do |product|
      product.price = data[:price]
    end
  end

  puts "Products seeded!"
end
