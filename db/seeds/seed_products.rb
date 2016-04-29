100.times do |i|
  rand = Random.new
  name = Faker::Commerce.product_name
  sku  = Faker::Code.isbn
  p "create product - #{name}"
  Product.create(
      name:        name,
      meta_title:  name,
      sku:         sku,
      mini_desc:   Faker::Lorem.paragraph,
      desc:        Faker::Lorem.paragraph,
      meta_title:  name,
      meta_desc:   name,
      meta_key:    name,
      active:      true,
      category_id: rand.rand(1..15),
  )
end
