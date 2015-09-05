require "faker"

FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password 'helloworld'
    password_confirmation "helloworld"
    confirmed_at Time.now
    username Faker::Lorem.characters(10)
  end
end
