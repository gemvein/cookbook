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

        # Relationships
        has_many :uses, as: :use_in, class_name: 'Cookbook::Use'
        associate_used_in
      end

      # Extended by has_cookbook mixin
      module ClassMethods
        attr_accessor(:used_in)

        def associate_used_in
          used_in.each do |table_sym|
            model = table_sym.to_s.classify.constantize
            name = model.model_name.to_s
            uses_symbol = "#{model.model_name.param_key}_uses".to_sym

            has_many uses_symbol, lambda {
              where(use_of_type: name)
            }, as: :use_in, class_name: 'Cookbook::Use'
            accepts_nested_attributes_for uses_symbol, reject_if: :all_blank, allow_destroy: true

            has_many table_sym, through: :uses, source: :use_of, source_type: name
          end
        end
      end

      # Included by has_cookbook mixin
      module InstanceMethods
      end
    end
  end
end
