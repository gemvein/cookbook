# frozen_string_literal: true

module Cookbook
  module Mixins
    # ActsAsUseIn Mixin, for things like Tools, Supplies, or Ingredients
    module ActsAsUsedIn
      extend ActiveSupport::Concern

      def acts_as_used_in(*model_symbols)
        extend ClassMethods
        include InstanceMethods

        tables = model_symbols
        self.label_method = :name
        Cookbook::Use.add_use_of(table_name.to_sym)

        # Relationships
        has_many :uses, as: :use_of, class_name: 'Cookbook::Use'
        associate_uses_of(tables)

        if defined?(RailsAdmin)
          rails_admin do
            field :uses do
              visible false
            end
            tables.each do |table_sym| # We don't want these associations to show
              table_uses_sym = "#{table_sym.to_s.singularize}_uses".to_sym
              field table_uses_sym do
                visible false
              end
              field table_sym do
                visible false
              end
            end
          end
        end
      end

      # Extended by acts_as_used_in mixin
      module ClassMethods
        attr_accessor :label_method

        def associate_uses_of(tables)
          tables.each do |table_sym|
            model = table_sym.to_s.classify.constantize
            name = model.model_name.to_s

            has_many "#{model.model_name.param_key}_uses".to_sym, lambda {
              where(use_in_type: name)
            }, as: :use_of, class_name: 'Cookbook::Use'
            has_many table_sym, through: :uses, source: :use_in, source_type: name
          end
        end
      end

      # Included by has_cookbook mixin
      module InstanceMethods
      end
    end
  end
end
