10.times do
  Company.create!(name: Faker::Company.name, website: Faker::Internet.domain_name, size: rand(1..500))
end
