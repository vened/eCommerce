# Category.create(
#     name:       'Каталог',
#     title:      'Каталог',
#     meta_title: 'Каталог',
#     meta_key:   'Каталог',
#     active:        true
# )

6.times do |i|
  name = Faker::Commerce.department(1, true)
  p "create category no parent"
  p name
  Category.create(
      name:       name,
      title:      name,
      meta_title: name,
      meta_key:   name,
      meta_desc:  Faker::Lorem.paragraph,
      desc:       Faker::Lorem.paragraph,
      active:     true
  )
end

5.times do |i|
  # rand      = Random.new
  # parent_id = rand.rand(1000)
  parent_id = 2
  name      = Faker::Commerce.department(2, true)
  if parent_id > 0
    p "create category parent_id - #{parent_id}"
    p name
    Category.create(
        name:       name,
        title:      name,
        meta_title: name,
        meta_key:   name,
        meta_desc:  Faker::Lorem.paragraph,
        desc:       Faker::Lorem.paragraph,
        active:     true,
        parent_id:  parent_id
    )
  end
end

5.times do |i|
  # rand      = Random.new
  # parent_id = rand.rand(1000)
  parent_id = 5
  name      = Faker::Commerce.department(2, true)
  if parent_id > 0
    p "create category parent_id - #{parent_id}"
    p name
    Category.create(
        name:       name,
        title:      name,
        meta_title: name,
        meta_key:   name,
        meta_desc:  Faker::Lorem.paragraph,
        desc:       Faker::Lorem.paragraph,
        active:     true,
        parent_id:  parent_id
    )
  end
end
