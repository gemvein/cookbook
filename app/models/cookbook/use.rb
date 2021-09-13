# frozen_string_literal: true

module Cookbook
  # Cookbook::Use is basically a linking table with extra information.
  class Use < ApplicationRecord
    # Relationships
    belongs_to :use_in, polymorphic: true
    belongs_to :use_of, polymorphic: true

    # Scopes
    scope :recipe_uses, -> { where use_in_type: 'Recipe' }
    scope :ingredient_uses, -> { where use_of_type: 'Ingredient' }

    # Methods
    def quantity_with_unit
      [quantity, unit].compact.join(' ')
    end

    def quantity
      min = quantity_minimum&.format_quantity
      max = quantity_maximum&.format_quantity

      [min, max].compact.join('–') # ndash, not hyphen
    end

    if defined?(RailsAdmin)
      rails_admin do
        visible false
        edit do
          include_all_fields
          field :use_in do
            visible false
          end
        end
      end
    end
  end
end
