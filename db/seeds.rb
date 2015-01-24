# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do
  User.create(handle: Faker::Internet.domain_name.split('.')[0], password: 'abc')
end
1000.times do
  Message.create(content: Faker::Company.bs, sender_id: rand(100) + 1, receiver_id: rand(100) + 1)
end