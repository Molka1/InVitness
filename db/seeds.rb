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

ella = User.create(email: "ella@email.com", password: "123456", username: "ellas", location: "London")
bob = User.create(email: "bob@email.com", password: "123456", username: "bobbb", location: "Sydney")
molka = User.create(email: "molka@email.com", password: "123456", username: "molka1", location: "Paris")
harry = User.create(email: "harry@email.com", password: "123456", username: "harrystyles", location: "LA")
alan = User.create(email: "alan@email.com", password: "123456", username: "alàn", location: "Le Wagon")

file = URI.open('https://images.pexels.com/photos/8758859/pexels-photo-8758859.jpeg?cs=srgb&dl=pexels-evelina-zhu-8758859.jpg&fm=jpg')
challenge = Challenge.new(
  name: "Girls Workout Group!",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 14),
  end_date: Faker::Date.forward(days: 40),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "30 minutes minimum / or walking 10, 000 steps",
  maximum: "3 exercise sessions per week",
  proof: "Must post photo",
  points: "If you don't log your workout by the end of the week it will not count.",
  rollover: [true, false].sample,
  user: ella
)
challenge.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge.save!

file = URI.open('https://images.pexels.com/photos/39671/physiotherapy-weight-training-dumbbell-exercise-balls-39671.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
challenge2 = Challenge.new(
  name: "Beginners",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 14),
  end_date: Faker::Date.forward(days: 40),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "30 minutes minimum / or walking 10, 000 steps",
  maximum: "3 exercise sessions per week",
  proof: "Must post photo",
  points: "If you don't log your workout by the end of the week it will not count.",
  rollover: [true, false].sample,
  user: bob
)
challenge2.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge2.save!

file = URI.open('https://images.pexels.com/photos/317157/pexels-photo-317157.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
challenge3 = Challenge.new(
  name: "Outdoor!",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 14),
  end_date: Faker::Date.forward(days: 40),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "30 minutes minimum / or walking 10, 000 steps",
  maximum: "3 exercise sessions per week",
  proof: "Must post photo",
  points: "If you don't log your workout by the end of the week it will not count.",
  rollover: [true, false].sample,
  user: ella
)
challenge3.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge3.save!

file = URI.open('https://images.pexels.com/photos/3094230/pexels-photo-3094230.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
challenge4 = Challenge.new(
  name: "Mums and Kids!",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 14),
  end_date: Faker::Date.forward(days: 40),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "30 minutes minimum / or walking 10, 000 steps",
  maximum: "3 exercise sessions per week",
  proof: "Must post photo",
  points: "If you don't log your workout by the end of the week it will not count.",
  rollover: [true, false].sample,
  user: bob
)
challenge4.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge4.save!

file = URI.open('https://images.pexels.com/photos/2526878/pexels-photo-2526878.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
challenge5 = Challenge.new(
  name: "Get Active!",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 14),
  end_date: Faker::Date.forward(days: 40),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "30 minutes minimum / or walking 10, 000 steps",
  maximum: "3 exercise sessions per week",
  proof: "Must post photo",
  points: "If you don't log your workout by the end of the week it will not count.",
  rollover: [true, false].sample,
  user: harry
)
challenge5.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge5.save!

file = URI.open('https://images.pexels.com/photos/39308/runners-silhouettes-athletes-fitness-39308.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
challenge6 = Challenge.new(
  name: "Runnnnn!",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 14),
  end_date: Faker::Date.forward(days: 40),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "30 minutes minimum / or walking 10, 000 steps",
  maximum: "3 exercise sessions per week",
  proof: "Must post photo",
  points: "If you don't log your workout by the end of the week it will not count.",
  rollover: [true, false].sample,
  user: alan
)
challenge6.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge6.save!

file = URI.open('https://images.pexels.com/photos/841131/pexels-photo-841131.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
challenge7 = Challenge.new(
  name: "Strong !!",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 14),
  end_date: Faker::Date.forward(days: 40),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "30 minutes minimum / or walking 10, 000 steps",
  maximum: "3 exercise sessions per week",
  proof: "Must post photo",
  points: "If you don't log your workout by the end of the week it will not count.",
  rollover: [true, false].sample,
  user: harry
)
challenge7.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge7.save!

file = URI.open('https://images.pexels.com/photos/2291874/pexels-photo-2291874.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
challenge8 = Challenge.new(
  name: "Let's Go!",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 14),
  end_date: Faker::Date.forward(days: 40),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "30 minutes minimum / or walking 10, 000 steps",
  maximum: "3 exercise sessions per week",
  proof: "Must post photo",
  points: "If you don't log your workout by the end of the week it will not count.",
  rollover: [true, false].sample,
  user: molka
)
challenge8.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge8.save!

file = URI.open('https://images.pexels.com/photos/2294363/pexels-photo-2294363.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
challenge9 = Challenge.new(
  name: "Strength!",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 14),
  end_date: Faker::Date.forward(days: 40),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "30 minutes minimum / or walking 10, 000 steps",
  maximum: "3 exercise sessions per week",
  proof: "Must post photo",
  points: "If you don't log your workout by the end of the week it will not count.",
  rollover: [true, false].sample,
  user: alan
)
challenge9.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge9.save!

file = URI.open('https://images.pexels.com/photos/1199607/pexels-photo-1199607.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
challenge10 = Challenge.new(
  name: "No Equipment Get Fit!",
  amount: rand(10..100),
  start_date: Faker::Date.backward(days: 14),
  end_date: Faker::Date.forward(days: 40),
  code: Faker::Number.number(digits: 10),
  private: [true, false].sample,
  exercise_length: "30 minutes minimum / or walking 10, 000 steps",
  maximum: "3 exercise sessions per week",
  proof: "Must post photo",
  points: "If you don't log your workout by the end of the week it will not count.",
  rollover: [true, false].sample,
  user: molka
)
challenge10.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge10.save!
