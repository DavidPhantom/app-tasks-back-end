# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    title { Faker::Lorem.words(number: 1) }
  end
end
