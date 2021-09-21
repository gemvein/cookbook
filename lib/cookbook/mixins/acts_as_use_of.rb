# frozen_string_literal: true

module Cookbook
  module Mixins
    # ActsAsUseIn Mixin, for things like Recipes or HowTos
    module ActsAsUseOf
      extend ActiveSupport::Concern

      def acts_as_use_of(*model_symbols)
        extend ClassMethods
        include InstanceMethods

        self.used_in = model_symbols
        Cookbook::Use.add_use_in(table_name.to_sym)

        # Relationships
        has_many :uses, as: :use_in, class_name: 'Cookbook::Use', inverse_of: :use_in
        # Used only as a setter, not a getter
        accepts_nested_attributes_for :uses, reject_if: :all_blank, allow_destroy: true
        associate_used_in

        used_in.each do |table_sym|
          singular = table_sym.to_s.singularize
          model = singular.classify.constantize
          equals_method_symbol = "#{singular}_uses_attributes=".to_sym
          define_method(equals_method_symbol) do |values|
            items = []
            values.each_pair do |key, value|
              value['use_in'] = self
              value['use_of'] = model.find_by(id: value['use_of_id'])
              items << value
            end
            self.uses_attributes = items
          end
        end
      end

      # Extended by has_cookbook mixin
      module ClassMethods
        attr_accessor(:used_in)

        def associate_used_in
          tables = used_in
          tables.each do |table_sym|
            model = table_sym.to_s.classify.constantize
            name = model.model_name.to_s
            uses_symbol = "#{model.model_name.param_key}_uses".to_sym
            singular_symbol = table_sym.to_s.singularize.to_sym

            has_many uses_symbol, lambda {
              where(use_of_type: name)
            }, as: :use_in, class_name: 'Cookbook::Use', inverse_of: singular_symbol

            # Used only as a getter, not a setter
            accepts_nested_attributes_for uses_symbol, reject_if: :all_blank, allow_destroy: true

            has_many table_sym, through: uses_symbol, source: :use_of, source_type: name

            if defined?(RailsAdmin)
              rails_admin do
                include_all_fields
                field :uses do
                  visible false
                end
                tables.each do |table_sym|
                  singular = table_sym.to_s.singularize
                  uses_symbol = "#{singular}_uses".to_sym
                  field uses_symbol do # Show only on reload
                    visible do
                      !bindings[:object].new_record?
                    end
                  end
                  field table_sym do # We don't want these associations to show
                    visible false
                  end
                end
              end
            end
          end
        end
      end

      # Included by has_cookbook mixin
      module InstanceMethods
      end
    end
  end
end
