# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, aliases: [:owner] do
    email 'admin@example.com'
    name 'Some Name'
    password 'somelongpassword'
    password_confirmation 'somelongpassword'
  end
end
