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
NUMBER_OF_TESTS = 30
NUMBER_USERS = 20
NUMBER_OF_QUESTIONS = 100

Answer.delete_all
Question.delete_all
Test.delete_all
User.delete_all
Category.delete_all

NUMBER_OF_CATEGORIES.times do
  Category.create!(title: Faker::Educator.primary_school)
end
puts 'Catergory created'

NUMBER_USERS.times do
  User.create!(name: Faker::FunnyName.two_word_name)
end
category_ids = Category.pluck(:id)
user_ids = User.pluck(:id)
NUMBER_OF_TESTS.times do
  Test.create!(title: Faker::Educator.subject,
               level: rand(1..NUBER_OF_LEVELS),
               category_id: category_ids.sample,
               author_id: user_ids.sample)
end
puts 'Test created'

test_ids = Test.pluck(:id)
NUMBER_OF_QUESTIONS.times do
  Question.create!(body: Faker::Lorem.question(word_count: 4),
                   test_id: test_ids.sample)
end
puts 'Question created'

Question.pluck(:id).each do |question_id|
  2.times do
    Answer.create!(body: Faker::Lorem.word, correct: false, question_id: question_id)
  end
  Answer.create!(body: Faker::Games::WorldOfWarcraft.hero, correct: true, question_id: question_id)
end
puts 'Answer created'

100.times do
  UserTest.create!(user_id: user_ids.sample, test_id: test_ids.sample)
end
