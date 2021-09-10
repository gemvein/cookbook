# frozen_string_literal: true

Cookbook.configure do |config|
  config.include_cookbook_css = true
  config.authorize_with = :cancancan
end
