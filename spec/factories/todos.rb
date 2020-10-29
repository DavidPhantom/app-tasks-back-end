# frozen_string_literal: true

FactoryBot.define do
  factory :todo do
    text { Faker::Lorem.sentence(word_count: 2) }
    isCompleted { false }
    project { create(:project) }
  end
end
