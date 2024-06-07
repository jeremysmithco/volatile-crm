companies = 10.times.map do
  Company.create!(
    name: Faker::Company.name,
    website: Faker::Internet.domain_name,
    size: rand(1..500)
  )
end

20.times do
  username = Faker::Internet.username(separators: %w(_ -))
  contact = Contact.create!(
    company: companies.sample,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: rand(7300..21900).days.ago,
    location: ["", "#{Faker::Address.city}, #{Faker::Address.state_abbr}"].sample,
    email: Faker::Internet.unique.email,
    phone: ["", Faker::PhoneNumber.cell_phone].sample,
    website: ["", Faker::Internet.url].sample,
    twitter: ["", username].sample,
    linkedin: ["", username].sample,
    github: ["", username].sample,
  )

  if rand(1..10) > 2
    num = rand(0..16)
    avatar_path = Rails.root.join("db/seeds/images/avatars/#{num}.jpg")
    contact.avatar.attach(io: File.new(avatar_path), filename: "#{num}.jpg")
  end
end
