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

ella = User.create(email: "ella@email.com", password: "123456")

10.times do
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
  challenge.save!
end
