# frozen_string_literal: true

class HowTo < ApplicationRecord
  acts_as_use_of :tools, :supplies
end
