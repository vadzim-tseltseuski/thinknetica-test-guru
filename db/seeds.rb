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
NUMBER_OF_TESTS = 17
NUMBER_USERS = 5
NUMBER_OF_QUESTIONS = 100

Answer.delete_all
Gist.delete_all
Question.delete_all
Test.delete_all
User.delete_all
Category.delete_all

categories = []
NUMBER_OF_CATEGORIES.times do
  categories << Category.create!(title: Faker::Educator.primary_school)
end
puts 'Catergory created'

users = []
NUMBER_USERS.times do |index|
  users << User.create!(type: User, first_name: Faker::FunnyName.two_word_name, last_name: 'T', email: "vadtel#{index}@testguru.com", password: '123456')
end

admin = User.create!(type: Admin, first_name: 'VadimAdmin', last_name: 'T', email: ENV['ADMIN_EMAIL'], password: ENV['ADMIN_PASSWORD'])

tests = []
NUMBER_OF_TESTS.times do
  tests << Test.create!(title: Faker::Educator.unique.subject,
                        level: rand(1..NUBER_OF_LEVELS),
                        category: categories.sample,
                        author: admin)
end
puts 'Test created'

3.times do
  tests << Test.create!(title: "#{Faker::Educator.unique.subject}_timer",
                        level: rand(1..NUBER_OF_LEVELS),
                        category: categories.sample,
                        timer: 1,
                        author: admin)
end
puts 'Test with timer created'

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

Badge.create!([
  { title: 'Category complete successfully!',
    image_url: "https://cdn-icons-png.flaticon.com/512/4105/4105454.png",
    rule: "category_complete",
    rule_option: 1
  },
  { title: 'Fist try!',
    image_url: "https://cdn-icons-png.flaticon.com/512/4105/4105444.png",
    rule: "first_try_complete"
  },
  { title: 'Complete all test by level!',
    image_url: "https://cdn-icons-png.flaticon.com/512/4105/4105445.png",
    rule: "level_complete",
    rule_option: 3
  }
])

id = User.where(email: ENV['ADMIN_EMAIL']).first.id
UserBadge.create!([
  {user_id: id, badge_id: 1}, {user_id: id, badge_id: 2}, {user_id: id, badge_id: 3}
])

admin.confirm
users.each(&:confirm)
