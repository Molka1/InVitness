# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"
puts "cleaning database"
Exercise.destroy_all
Challenge.destroy_all
User.destroy_all
puts "creating products"

ella = User.create(email: "ella@email.com", password: "123456", username: "ellaskolnick", location: "De Beauvoir, London", name: "Ella", age: 24, favourite: "Zumba")
susannah = User.create(email: "susannah@email.com", password: "123456", username: "susannahtay", location: "camden, London", name: "Susannah", age: 25, favourite: "Cycling")
molka = User.create(email: "molka@email.com", password: "123456", username: "molka1", location: "Hoxton, London", name: "Molka", age: 30, favourite: "Yoga")
sachin = User.create(email: "sachin@email.com", password: "123456", username: "sachimp", location: "Haggerston, London", name: "Sachin", age: 28, favourite: "Running")
alan = User.create(email: "alan@email.com", password: "123456", username: "Alan-Ruiz", location: "Islington, London", name: "Alàn", age: 25, favourite: "Weight Training")
ashton  = User.create(email: "ashton@email.com", password: "123456", username: "acharge91", location: "Angel, London", name: "Ashton", age: 29, favourite: "Cycling")
fiorella = User.create(email: "fiorella@email.com", password: "123456", username: "sajifio", location: "Shoreditch, London", name: "Fiorella", age: 24, favourite: "Running")
andrea = User.create(email: "andrea@email.com", password: "123456", username: "AAATL", location: "Spitalfields, London", name: "Andrea", age: 24, favourite: "Pilates")
alex = User.create(email: "alex@email.com", password: "123456", username: "alexhtaylor", location: "Bank, London", name: "Alex", age: 25, favourite: "Football")
luiza = User.create(email: "luiza@email.com", password: "123456", username: "l-p-n", location: "Clerkenwell, , London", name: "Luiza", age: 25, favourite: "Football")
kassra =  User.create(email: "kassra@email.com", password: "123456", username: "kazthemaz", location: "Aldgate, London", name: "Kassra", age: 25, favourite: "Hot yoga")
ben =  User.create(email: "ben@email.com", password: "123456", username: "benmclaren", location: "Aldgate East, London", name: "Ben", age: 25, favourite: "Hot yoga")
dean = User.create(email: "dean@email.com", password: "123456", username: "DeanTResi", location: "Holborn, London", name: "Dean", age: 25, favourite: "coding")
raph =  User.create(email: "raph@email.com", password: "123456", username: "r-manet", location: "Finsbury, London", name: "Raph", age: 22, favourite: "Yoga")



file = URI.open('https://images.pexels.com/photos/235724/pexels-photo-235724.jpeg?cs=srgb&dl=pexels-pixabay-235724.jpg&fm=jpg')
challenge = Challenge.new(
  name: "Rails in the sun, Le Wagon",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 14),
  end_date: Faker::Date.forward(days: 40),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "20",
  maximum: "2",
  proof: "Must post photo",
  user: ben
)
challenge.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge.save!
UserChallenge.create(user: ben, challenge: challenge)
Chatroom.create(name: challenge.name, challenge: challenge)

file = URI.open('https://images.pexels.com/photos/669577/pexels-photo-669577.jpeg?cs=srgb&dl=pexels-lukas-669577.jpg&fm=jpg')
challenge1 = Challenge.new(
  name: "Work hard",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 14),
  end_date: Faker::Date.forward(days: 40),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "60",
  maximum: "5",
  user: alan
)
challenge1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge1.save!
UserChallenge.create(user: alan, challenge: challenge1)
Chatroom.create(name: challenge1.name, challenge: challenge1)

file = URI.open('https://images.pexels.com/photos/273062/pexels-photo-273062.jpeg?cs=srgb&dl=pexels-pixabay-273062.jpg&fm=jpg')
challenge2 = Challenge.new(
  name: "Le Wagon 5 Lunges per falshcard ",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 10),
  end_date: Faker::Date.forward(days: 30),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "30",
  maximum: "5",
  user: alan
)
challenge2.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge2.save!
UserChallenge.create(user: alan, challenge: challenge2)
UserChallenge.create(user: ella, challenge:challenge2)
UserChallenge.create(user: susannah, challenge: challenge2)
UserChallenge.create(user: sachin, challenge: challenge2)
Chatroom.create(name: challenge2.name, challenge: challenge2)



file = URI.open('https://images.pexels.com/photos/4775192/pexels-photo-4775192.jpeg?cs=srgb&dl=pexels-maksim-goncharenok-4775192.jpg&fm=jpg')
challenge3 = Challenge.new(
  name: "Outdoor!",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 14),
  end_date: Faker::Date.forward(days: 40),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "45",
  maximum: "5",
  user: susannah
)
challenge3.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge3.save!
UserChallenge.create(user: susannah, challenge: challenge3)
Chatroom.create(name: challenge3.name, challenge: challenge3)

file = URI.open('https://images.pexels.com/photos/4473611/pexels-photo-4473611.jpeg?cs=srgb&dl=pexels-ketut-subiyanto-4473611.jpg&fm=jpg')
challenge4 = Challenge.new(
  name: "Family fun",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 3),
  end_date: Faker::Date.forward(days: 60),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "30",
  maximum: "5",
  user: molka
)
challenge4.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge4.save!
UserChallenge.create(user: molka, challenge: challenge4)
UserChallenge.create(user: andrea, challenge: challenge4)
UserChallenge.create(user: fiorella, challenge: challenge4)
Chatroom.create(name: challenge4.name, challenge: challenge4)

file1 = URI.open('https://res.cloudinary.com/dsddw9xiv/image/upload/v1646926373/proof2_qbbnc5.jpg')
exercise1 = Exercise.create(user: molka, challenge: challenge4 , name: "tennis avec les loulous")
exercise1.photo.attach(io: file1, filename: 'nes.png', content_type: 'image/jpg')
exercise1.save!

file2 = URI.open('https://res.cloudinary.com/dsddw9xiv/image/upload/v1646926380/proof3_ayvcp5.jpg')
exercise2 = Exercise.create(user: andrea, challenge: challenge4 , name: "Milf on the eliptical!")
exercise2.photo.attach(io: file2, filename: 'nes.png', content_type: 'image/jpg')
exercise2.save!

file3 = URI.open('https://res.cloudinary.com/dsddw9xiv/image/upload/v1646926377/proof1_oe5yl9.jpg')
exercise3 = Exercise.create(user: molka, challenge: challenge4 , name: "Walk in the park")
exercise3.photo.attach(io: file3, filename: 'nes.png', content_type: 'image/jpg')
exercise3.save!

file4 = URI.open('https://res.cloudinary.com/dsddw9xiv/image/upload/v1646926393/proof4_xgc7xi.jpg')
exercise4 = Exercise.create(user: fiorella, challenge: challenge4 , name: "Run with my sis")
exercise4.photo.attach(io: file4, filename: 'nes.png', content_type: 'image/jpg')
exercise4.save!



file = URI.open('https://images.pexels.com/photos/863926/pexels-photo-863926.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-863926.jpg&fm=jpg')
challenge5 = Challenge.new(
  name: "Get Active!",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 14),
  end_date: Faker::Date.forward(days: 40),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "20",
  maximum: "2",
  proof: "Must post photo",
  user: fiorella
)
challenge5.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge5.save!
UserChallenge.create(user: fiorella, challenge: challenge5)
Chatroom.create(name: challenge5.name, challenge: challenge5)

file = URI.open('https://images.pexels.com/photos/39308/runners-silhouettes-athletes-fitness-39308.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
challenge6 = Challenge.new(
  name: "Run 10k challenge!",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 1),
  end_date: Faker::Date.forward(days: 40),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "60",
  maximum: "5",
  user: alan
)
challenge6.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge6.save!
UserChallenge.create(user: alan, challenge: challenge6)
UserChallenge.create(user: molka, challenge: challenge6)
Chatroom.create(name: challenge6.name, challenge: challenge6)

file = URI.open('https://images.pexels.com/photos/841131/pexels-photo-841131.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
challenge7 = Challenge.new(
  name: "Strong!",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 1),
  end_date: Faker::Date.forward(days: 40),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "20",
  maximum: "2",
  user: molka
)
challenge7.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge7.save!
UserChallenge.create(user: molka, challenge: challenge7)
Chatroom.create(name: challenge7.name, challenge: challenge7)

file = URI.open('https://images.pexels.com/photos/345415/pexels-photo-345415.jpeg?cs=srgb&dl=pexels-rafa-de-345415.jpg&fm=jpg')
challenge8 = Challenge.new(
  name: "Just Do It",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 1),
  end_date: Faker::Date.forward(days: 60),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "20",
  maximum: "4",
  user: molka
)
challenge8.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge8.save!
UserChallenge.create(user: molka, challenge: challenge8)
Chatroom.create(name: challenge8.name, challenge: challenge8)

file = URI.open('https://images.pexels.com/photos/2294363/pexels-photo-2294363.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
challenge9 = Challenge.new(
  name: "Strength!",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 14),
  end_date: Faker::Date.forward(days: 40),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "30",
  maximum: "3",
  user: alan
)
challenge9.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge9.save!
UserChallenge.create(user: alan, challenge: challenge9)
Chatroom.create(name: challenge9.name, challenge: challenge9)

file = URI.open('https://images.pexels.com/photos/2780762/pexels-photo-2780762.jpeg?cs=srgb&dl=pexels-karl-solano-2780762.jpg&fm=jpg')
challenge10 = Challenge.new(
  name: "No Equipment Get Fit!",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 1),
  end_date: Faker::Date.forward(days: 50),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "60",
  maximum: "4",
  rollover: [true, false].sample,
  user: molka
)
challenge10.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge10.save!
UserChallenge.create(user: molka, challenge: challenge10)
Chatroom.create(name: challenge10.name, challenge: challenge10)


file = URI.open('https://images.pexels.com/photos/374101/pexels-photo-374101.jpeg?cs=srgb&dl=pexels-burst-374101.jpg&fm=jpg')
challenge11 = Challenge.new(
  name: "All you need is your mat",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 50),
  end_date:  Faker::Date.backward(days: 1),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "60",
  maximum: "4",
  rollover: [true, false].sample,
  user: molka
)
challenge11.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge11.save!
UserChallenge.create(user: molka, challenge: challenge11)
Chatroom.create(name: challenge10.name, challenge: challenge11)

file = URI.open('https://res.cloudinary.com/dsddw9xiv/image/upload/v1646928089/RAILS_udrejz.png')
challenge12 = Challenge.new(
  name: "Le Wagon batch807 ",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 1),
  end_date: Faker::Date.forward(days: 50),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "30",
  maximum: "5",
  user: ben
)
puts "creating members"
challenge12.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge12.save!
UserChallenge.create(user: ben, challenge: challenge12)
UserChallenge.create(user: alan, challenge: challenge2)
UserChallenge.create(user: ella, challenge: challenge12)
UserChallenge.create(user: susannah, challenge: challenge12)
UserChallenge.create(user: alan, challenge: challenge12)
UserChallenge.create(user: ashton, challenge: challenge12)
UserChallenge.create(user: fiorella, challenge: challenge12)
UserChallenge.create(user: luiza, challenge: challenge12)
UserChallenge.create(user: alex, challenge: challenge12)
UserChallenge.create(user: andrea, challenge: challenge12)
UserChallenge.create(user: sachin, challenge: challenge12)
UserChallenge.create(user: kassra, challenge: challenge12)
UserChallenge.create(user: dean, challenge: challenge12)
UserChallenge.create(user: raph, challenge: challenge12)
Chatroom.create(name: challenge12.name, challenge: challenge12)

file = URI.open('https://images.pexels.com/photos/6339715/pexels-photo-6339715.jpeg?cs=srgb&dl=pexels-pavel-danilyuk-6339715.jpg&fm=jpg')
challenge13 = Challenge.new(
  name: "Le Wagon pilates ",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 1),
  end_date: Faker::Date.forward(days: 50),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "30",
  maximum: "5",
  user: raph
)
challenge13.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge13.save!
UserChallenge.create(user: raph, challenge: challenge13)
UserChallenge.create(user: alan, challenge: challenge13)
UserChallenge.create(user: ella, challenge: challenge13)
UserChallenge.create(user: ella, challenge: challenge13)
UserChallenge.create(user: susannah, challenge: challenge13)
UserChallenge.create(user: sachin, challenge: challenge13)
Chatroom.create(name: challenge12.name, challenge: challenge13)

file = URI.open('https://images.pexels.com/photos/1552252/pexels-photo-1552252.jpeg?cs=srgb&dl=pexels-leon-ardho-1552252.jpg&fm=jpg')
challenge14 = Challenge.new(
  name: "Get stronger ",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 70),
  end_date:  Faker::Date.backward(days: 1),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "30",
  maximum: "4",
  rollover: [true, false].sample,
  user: molka
)
challenge14.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge14.save!
UserChallenge.create(user: molka, challenge: challenge14)
Chatroom.create(name: challenge14.name, challenge: challenge14)

file = URI.open('https://images.pexels.com/photos/3094230/pexels-photo-3094230.jpeg?cs=srgb&dl=pexels-valeria-ushakova-3094230.jpg&fm=jpg')
challenge15 = Challenge.new(
  name: "Family yoga ",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 70),
  end_date:  Faker::Date.backward(days: 1),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "30",
  maximum: "4",
  rollover: [true, false].sample,
  user: molka
)
challenge15.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge15.save!
UserChallenge.create(user: molka, challenge: challenge15)
Chatroom.create(name: challenge15.name, challenge: challenge15)

file = URI.open('https://images.pexels.com/photos/3822164/pexels-photo-3822164.jpeg?cs=srgb&dl=pexels-elina-fairytale-3822164.jpg&fm=jpg')
challenge16 = Challenge.new(
  name: "Stimulus Sweat ",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 70),
  end_date:  Faker::Date.backward(days: 1),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "30",
  maximum: "4",
  rollover: [true, false].sample,
  user: molka
)
challenge15.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge15.save!
UserChallenge.create(user: molka, challenge: challenge16)
Chatroom.create(name: challenge16.name, challenge: challenge16)