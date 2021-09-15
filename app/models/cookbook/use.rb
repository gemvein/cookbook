# frozen_string_literal: true

module Cookbook
  # Cookbook::Use is basically a linking table with extra information.
  class Use < ApplicationRecord
    attr_accessor(:used_in_tables)

    # Relationships
    belongs_to :use_in, polymorphic: true, inverse_of: :uses
    belongs_to :use_of, polymorphic: true, inverse_of: :uses

    class << self
      def add_use_of(table_sym)
        singular = table_sym.to_s.singularize
        model_name = singular.classify.constantize.to_s
        belongs_to singular.to_sym, class_name: model_name, foreign_key: :use_in_id, inverse_of: "#{singular}_uses".to_sym, optional: true
      end

      def add_use_in(table_sym)
        singular = table_sym.to_s.singularize
        model_name = singular.classify.constantize.to_s
        belongs_to singular.to_sym, class_name: model_name, foreign_key: :use_of_id, inverse_of: "#{singular}_uses".to_sym, optional: true
      end
    end

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
        abort bindings[:object].inspect
        visible false
        object_label_method { :object_label }
        edit do
          field :use_in do
            visible false
          end
          include_all_fields
        end
      end
    end
  end
end
