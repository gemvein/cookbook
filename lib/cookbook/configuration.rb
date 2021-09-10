# frozen_string_literal: true

# Cookbook Module
module Cookbook
  class << self
      def configure(configuration = Cookbook::Configuration.new)
        block_given? && yield(configuration)
        @configuration = configuration
      end

      def configuration
        @configuration ||= Cookbook::Configuration.new
      end

      private

      def model_symbols_by_attribute(attribute)
        ApplicationRecord
          .descendants
          .map { |x| x.name.to_s.constantize }
          .select { |x| x.respond_to?(attribute) && x.send(attribute) }
          .map { |x| x.table_name.to_sym }
      end
    end

  # Cookbook Configuration
  class Configuration
    attr_accessor(
      :variable
    )

    def initialize
      self.variable = []
    end
  end
end
