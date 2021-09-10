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

  require 'cookbook/mixins/acts_as_used_in'
  require 'cookbook/mixins/acts_as_use_of'
  require 'cookbook/extensions/float'

  require 'haml-rails'
  require 'sass-rails'
  require 'vanilla_nested'
  require 'cancancan'
  require 'simple_form'
  require 'kaminari'
end

ActiveRecord::Base.extend Cookbook::Mixins::ActsAsUsedIn
ActiveRecord::Base.extend Cookbook::Mixins::ActsAsUseOf
