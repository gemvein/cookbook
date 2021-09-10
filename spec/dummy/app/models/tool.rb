# frozen_string_literal: true

class Tool < ApplicationRecord
  acts_as_used_in :recipes, :how_tos
end
