# frozen_string_literal: true

module Cookbook
  # Cookbook Engine
  class Engine < Rails::Engine
    isolate_namespace Cookbook
    engine_name 'cookbook'

    initializer 'local_helper.action_controller' do
      ActiveSupport.on_load :action_controller do
        # helper Cookbook::ApplicationHelper
      end
    end
    initializer 'cookbook.assets.precompile' do |app|
      app.config.assets.precompile += %w[cookbook/application.css cookbook/application.js vanilla_nested.js]
    end

    config.generators do |g|
      g.hidden_namespaces << 'test_unit' << 'erb'
      g.orm             :active_record
      g.template_engine :haml
      g.test_framework  :rspec, fixture: false
      g.integration_tool :rspec
      g.stylesheets     false
      g.javascripts     false
      g.view_specs      false
      g.helper_specs    false
    end

    def self.table_name_prefix
      'cookbook_'
    end
  end
end
