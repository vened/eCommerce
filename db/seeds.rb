# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create(email: 'maxstbn@gmail.com', password: 'qwerty123', password_confirmation: 'qwerty123')

# Category.create(
#     name:       'Каталог',
#     title:      'Каталог',
#     meta_title: 'Каталог',
#     meta_key:   'Каталог',
#     pub:        true
# )


# 100.times do |i|
#   name = Faker::Commerce.department
#   p "create category no parent"
#   p name
#   Category.create(
#       name:       name,
#       title:      name,
#       meta_title: name,
#       pub:        true
#   )
# end

# 5.times do |i|
#   # rand      = Random.new
#   # parent_id = rand.rand(1000)
#   parent_id = 92
#   name      = Faker::Commerce.department
#   if parent_id > 0
#     p "create category parent_id - #{parent_id}"
#     p name
#     Category.create(
#         name:       name,
#         title:      name,
#         meta_title: name,
#         pub:        true,
#         parent_id:  parent_id
#     )
#   end
# end
