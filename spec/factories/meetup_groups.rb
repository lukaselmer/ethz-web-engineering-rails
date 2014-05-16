# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meetup_group do
    association :owner, factory: :user, email: 'with_mg@example.com'
    topic Faker::Lorem.words(4).join(' ')
    incepted_at 2.years.ago
    home_town Faker::Lorem.words(2).join(' ')
  end
end
