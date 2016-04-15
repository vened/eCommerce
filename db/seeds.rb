# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create(email: 'maxstbn@gmail.com', password: 'qwerty123', password_confirmation: 'qwerty123')

Category.create(
    name:       'Каталог',
    title:      'Каталог',
    meta_title: 'Каталог',
    meta_key:   'Каталог',
    pub:        true
)

10000.times do
  rand = Random.new
  cat  = "Категория #{rand.rand(10000000)}"
  Category.create(
      name:       cat,
      title:      cat,
      meta_title: cat,
      meta_key:   cat,
      pub:        true
  )
end
