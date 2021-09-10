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
  end

  # Cookbook Configuration
  class Configuration
    attr_accessor(
      :include_cookbook_css,
      :authorize_with
    )

    def initialize
      self.include_cookbook_css = false
      self.authorize_with = nil
    end
  end
end
