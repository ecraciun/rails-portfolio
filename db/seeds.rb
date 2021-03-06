# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |topic|
  Topic.create!(
    title: "Topic #{topic + 1}"
  )
end

puts '3 topics created'

10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog + 1}",
    body: 'This file should contain all the record creation needed to seed the database with its default values.This file should contain all the record creation needed to seed the database with its default values.This file should contain all the record creation needed to seed the database with its default values.This file should contain all the record creation needed to seed the database with its default values.This file should contain all the record creation needed to seed the database with its default values.This file should contain all the record creation needed to seed the database with its default values.This file should contain all the record creation needed to seed the database with its default values.This file should contain all the record creation needed to seed the database with its default values.This file should contain all the record creation needed to seed the database with its default values.',
    topic_id: Topic.last.id
  )
end

puts '10 blog posts created'

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill + 1}",
    percent_utilized: 15
  )
end

puts '5 skills created'

9.times do |portfolio|
  Portfolio.create!(
    title: "Portfolio title #{portfolio + 1}",
    subtitle: 'Etc bla bla bla',
    body: 'Some body. The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).',
    main_image: 'http://placehold.it/600x400',
    thumb_image: 'http://placehold.it/350x200'
  )
end

puts '9 portfolio items created'

3.times do |technology|
  Technology.create!(
    name: "Technology #{technology + 1}",
    portfolio_id: Portfolio.last.id
  )
end

puts '3 technologies created'
