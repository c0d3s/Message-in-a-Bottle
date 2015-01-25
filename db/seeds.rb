100.times do
  User.create(handle: Faker::Internet.domain_name.split('.')[0], password: 'abc', karma: 0)
end
1000.times do
  Message.create(content: Faker::Company.bs, sender_id: rand(100) + 1, receiver_id: rand(100) + 1)
end