# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

NUMBER_OF_CATEGORIES = 5
NUBER_OF_LEVELS = 5
NUMBER_OF_TESTS = 20
NUMBER_USERS = 20
NUMBER_OF_QUESTIONS = 100

Answer.delete_all
Question.delete_all
UserTest.delete_all
Test.delete_all
User.delete_all
Category.delete_all

categories = []
NUMBER_OF_CATEGORIES.times do
  categories << Category.create!(title: Faker::Educator.primary_school)
end
puts 'Catergory created'

users = []
NUMBER_USERS.times do
  users << User.create!(name: Faker::FunnyName.two_word_name)
end

tests = []
NUMBER_OF_TESTS.times do
  tests << Test.create!(title: Faker::Educator.unique.subject,
               level: rand(1..NUBER_OF_LEVELS),
               category: categories.sample,
               author: users.sample)
end
puts 'Test created'

questions = []
NUMBER_OF_QUESTIONS.times do
  questions << Question.create!(body: Faker::Lorem.question(word_count: 4),
                   test: tests.sample)
end
puts 'Question created'

questions.each do |question|
  2.times do
    Answer.create!(body: Faker::Lorem.word, correct: false, question: question)
  end
  Answer.create!(body: Faker::Games::WorldOfWarcraft.hero, correct: true, question: question)
end
puts 'Answer created'

100.times do
  UserTest.create!(user: users.sample, test: tests.sample)
end
puts 'UserTest created'
