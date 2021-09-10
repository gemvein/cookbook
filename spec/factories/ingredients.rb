# frozen_string_literal: true

FactoryBot.define do
  factory :ingredient do
    name { Faker::Lorem.words(number: [*1..3].sample).join(' ').titleize }
    slug { nil }
    description { Faker::Lorem.paragraph }
    aisle { 'Produce' }
    store { 'WholeEats' }
    cost { '$1.99' }
  end
end
