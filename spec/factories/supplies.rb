# frozen_string_literal: true

FactoryBot.define do
  factory :supply do
    name { Faker::Lorem.words(number: [*1..3].sample).join(' ').titleize }
    slug { nil }
    description { Faker::Lorem.paragraph }
    source { 'Restaurant Supply Store' }
  end
end
