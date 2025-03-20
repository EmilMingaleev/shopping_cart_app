after "products" do
  puts "Attaching Images to Products"

  Product.all.each_with_index do |product, index|
    image_name = "image-#{index + 1}.png"
    image_path = Rails.root.join("db/images/#{image_name}")

    if File.exist?(image_path)
      product.image.attach(
        io: File.open(image_path),
        filename: image_name
      )
      product.save!
      puts "Attached #{image_name} to #{product.name}"
    else
      puts "Image #{image_name} not found! Check path: #{image_path}"
    end
  end
end
