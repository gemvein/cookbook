# frozen_string_literal: true

# The class from which all other models inherit, including
# those in our engine
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
