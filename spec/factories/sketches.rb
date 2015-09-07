require "faker"

FactoryGirl.define do
  factory :sketch do
    title Faker::Book.title
    body "puts 'new sketch'"
  end
end
