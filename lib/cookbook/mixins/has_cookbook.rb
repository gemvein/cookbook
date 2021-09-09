# frozen_string_literal: true

module Cookbook
  module Mixins
    # HasCookbook Mixin
    module HasCookbook
      extend ActiveSupport::Concern

      # rubocop:disable Naming/PredicateName
      def has_cookbook(_options = {})
        extend ClassMethods
        include InstanceMethods

        # has_many :cookbook_citations, as: :record, class_name: 'Cookbook::Citation'
        # accepts_nested_attributes_for :cookbook_citations, allow_destroy: true
      end
      # rubocop:enable Naming/PredicateName

      # Extended by has_cookbook mixin
      module ClassMethods
      end

      # Included by has_cookbook mixin
      module InstanceMethods
      end
    end
  end
end
