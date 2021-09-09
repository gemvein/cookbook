# frozen_string_literal: true

# Cookbook module
module Cookbook
  VERSION = File.read(File.expand_path('../../VERSION', __dir__))
  def self.version_string
    "Cookbook version #{Cookbook::VERSION}"
  end
end
