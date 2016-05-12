100.times do |i|
  rand = Random.new
  name = Faker::Commerce.product_name
  p "create product - #{name}"
  Product.create(
      name:        name,
      meta_title:  name,
      mini_desc:   Faker::Lorem.paragraph,
      desc:        Faker::Lorem.paragraph,
      meta_title:  name,
      meta_desc:   name,
      meta_key:    name,
      active:      true
  )
end
