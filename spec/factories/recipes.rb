# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    name { Faker::Lorem.words(number: [*1..3].sample).join(' ').titleize }
    slug { nil }
    description { Faker::Lorem.paragraph }
    serves { '3-5 people' }
    meal { 'dinner' }
    instructions { Faker::Markdown.sandwich }
  end
end
