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

file = URI.open('https://images.pexels.com/photos/8758859/pexels-photo-8758859.jpeg?cs=srgb&dl=pexels-evelina-zhu-8758859.jpg&fm=jpg')
challenge = Challenge.new(
  name: Faker::Space.constellation,
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
challenge = Challenge.new(
  name: Faker::Space.constellation,
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
challenge.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge.save!

file = URI.open('https://images.pexels.com/photos/3094230/pexels-photo-3094230.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
challenge = Challenge.new(
  name: Faker::Space.constellation,
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
challenge.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
challenge.save!
