# frozen_string_literal: true

module Cookbook
  module Mixins
    # ActsAsUseIn Mixin, for things like Recipes or HowTos
    module ActsAsUseOf
      extend ActiveSupport::Concern

      # rubocop:disable Naming/PredicateName
      def acts_as_use_of(*model_symbols)
        extend ClassMethods
        include InstanceMethods

        self.used_in = model_symbols

        # Relationships
        has_many :uses, as: :use_in, class_name: 'Cookbook::Use'

        used_in.each do |table_sym|
          model = table_sym.to_s.classify.constantize
          name = model.model_name.to_s

          has_many "#{model.model_name.param_key}_uses".to_sym, -> { where(use_of_type: name) }, as: :use_in, class_name: 'Cookbook::Use'
          has_many table_sym, through: :uses, source: :use_of, source_type: name
        end
      end
      # rubocop:enable Naming/PredicateName

      # Extended by has_cookbook mixin
      module ClassMethods
        attr_accessor(:used_in)

        def is_use_of
          true
        end
      end

      # Included by has_cookbook mixin
      module InstanceMethods
      end
    end
  end
end
