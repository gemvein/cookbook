# frozen_string_literal: true

module Cookbook
  # Cookbook::Use is basically a linking table with extra information.
  class Use < ApplicationRecord
    # Relationships
    belongs_to :use_in, polymorphic: true
    belongs_to :use_of, polymorphic: true

    # Methods
    def object_label
      return use_of.name if use_of.respond_to?(:name)
      return use_of.title if use_of.respond_to?(:title)

      super
    end

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
        object_label_method { :object_label }
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
