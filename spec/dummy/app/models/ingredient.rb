# frozen_string_literal: true

class Ingredient < ApplicationRecord
  acts_as_used_in :recipes
end
