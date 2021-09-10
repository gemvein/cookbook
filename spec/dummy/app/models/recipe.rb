# frozen_string_literal: true

class Recipe < ApplicationRecord
  acts_as_use_of :ingredients, :tools, :supplies
end
