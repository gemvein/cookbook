# frozen_string_literal: true

# Cookbook Module
module Cookbook
  require 'active_record/railtie'
  require 'action_controller/railtie'
  require 'action_view/railtie'
  require 'sprockets/railtie'

  require 'cookbook/configuration'
  require 'cookbook/engine'
  require 'cookbook/railtie'
  require 'cookbook/version'

  require 'cookbook/mixins/has_cookbook'
  # require 'cookbook/extensions/time'

  require 'haml-rails'
  require 'sass-rails'
  require 'vanilla_nested'
  require 'cancancan'
  require 'simple_form'
  require 'kaminari'
end

ActiveRecord::Base.extend Cookbook::Mixins::HasCookbook
