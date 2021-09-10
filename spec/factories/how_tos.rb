# frozen_string_literal: true

FactoryBot.define do
  factory :how_to do
    name { Faker::Lorem.words(number: [*1..3].sample).join(' ').titleize }
    description { Faker::Lorem.paragraph }
    instructions { Faker::Markdown.sandwich }
  end
end
