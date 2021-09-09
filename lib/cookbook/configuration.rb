# frozen_string_literal: true

# Cookbook Module
module Cookbook
  def self.configure(configuration = Cookbook::Configuration.new)
    block_given? && yield(configuration)
    @configuration = configuration
  end

  def self.configuration
    @configuration ||= Cookbook::Configuration.new
  end

  # Cookbook Configuration
  class Configuration
    attr_accessor(
      :valid_citation_types,
      :valid_contributor_roles
    )

    def initialize
      self.valid_citation_types = %w[book periodical electronic interview email tweet]
      self.valid_contributor_roles = %w[author editor compiler translator receiver]
    end
  end
end
