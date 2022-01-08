10.times do |i|
  User::create([
    'name' => Faker::Name.name,
    'email' => "faker#{i}@faker.com",
    'password' => "password#{i}"
  ])
end
