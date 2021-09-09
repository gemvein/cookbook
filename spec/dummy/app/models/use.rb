# frozen_string_literal: true

class Use < ApplicationRecord
  belongs_to :use_in, polymorphic: true
  belongs_to :use_of, polymorphic: true
end
