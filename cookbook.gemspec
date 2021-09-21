# Generated by juwelier
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Juwelier::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: cookbook 0.1.5 ruby lib

Gem::Specification.new do |s|
  s.name = "cookbook".freeze
  s.version = "0.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "source_code_uri" => "http://github.com/gemvein/cookbook" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Loren Lundgren".freeze]
  s.date = "2021-09-21"
  s.description = "Cookbook allows you to associate instructions with components in a cross referenced way. Good for cooking recipes or an instruction manual for DIY projects.".freeze
  s.email = "loren.lundgren@gmail.com".freeze
  s.executables = ["rails".freeze]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".rubocop.yml",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "app/assets/stylesheets/cookbook/application.scss",
    "app/controllers/concerns/cookbook/params.rb",
    "app/helpers/cookbook/application_helper.rb",
    "app/models/cookbook/use.rb",
    "app/views/cookbook/_fields.html.haml",
    "app/views/cookbook/_used_in.html.haml",
    "app/views/cookbook/_uses_of.html.haml",
    "app/views/cookbook/uses/_fields.html.haml",
    "bin/rails",
    "config/initializers/simple_form.rb",
    "config/locales/simple_form.en.yml",
    "cookbook.gemspec",
    "db/migrate/20210909141929_create_uses.cookbook.rb",
    "lib/cookbook.rb",
    "lib/cookbook/configuration.rb",
    "lib/cookbook/engine.rb",
    "lib/cookbook/extensions/float.rb",
    "lib/cookbook/mixins/acts_as_use_of.rb",
    "lib/cookbook/mixins/acts_as_used_in.rb",
    "lib/cookbook/railtie.rb",
    "lib/cookbook/version.rb",
    "lib/tasks/cookbook_tasks.rake",
    "lib/templates/haml/scaffold/_form.html.haml",
    "spec/cookbook_spec.rb",
    "spec/dummy/Rakefile",
    "spec/dummy/app/assets/config/manifest.js",
    "spec/dummy/app/assets/images/.keep",
    "spec/dummy/app/assets/stylesheets/application.css",
    "spec/dummy/app/assets/stylesheets/scaffolds.scss",
    "spec/dummy/app/channels/application_cable/channel.rb",
    "spec/dummy/app/channels/application_cable/connection.rb",
    "spec/dummy/app/controllers/application_controller.rb",
    "spec/dummy/app/controllers/concerns/.keep",
    "spec/dummy/app/controllers/how_tos_controller.rb",
    "spec/dummy/app/controllers/ingredients_controller.rb",
    "spec/dummy/app/controllers/recipes_controller.rb",
    "spec/dummy/app/controllers/supplies_controller.rb",
    "spec/dummy/app/controllers/tools_controller.rb",
    "spec/dummy/app/javascript/packs/application.js",
    "spec/dummy/app/jobs/application_job.rb",
    "spec/dummy/app/mailers/application_mailer.rb",
    "spec/dummy/app/models/ability.rb",
    "spec/dummy/app/models/application_record.rb",
    "spec/dummy/app/models/concerns/.keep",
    "spec/dummy/app/models/how_to.rb",
    "spec/dummy/app/models/ingredient.rb",
    "spec/dummy/app/models/recipe.rb",
    "spec/dummy/app/models/supply.rb",
    "spec/dummy/app/models/tool.rb",
    "spec/dummy/app/models/user.rb",
    "spec/dummy/app/views/how_tos/_form.html.haml",
    "spec/dummy/app/views/how_tos/edit.html.haml",
    "spec/dummy/app/views/how_tos/index.html.haml",
    "spec/dummy/app/views/how_tos/new.html.haml",
    "spec/dummy/app/views/how_tos/show.html.haml",
    "spec/dummy/app/views/ingredients/_form.html.haml",
    "spec/dummy/app/views/ingredients/edit.html.haml",
    "spec/dummy/app/views/ingredients/index.html.haml",
    "spec/dummy/app/views/ingredients/new.html.haml",
    "spec/dummy/app/views/ingredients/show.html.haml",
    "spec/dummy/app/views/layouts/application.html.erb",
    "spec/dummy/app/views/layouts/mailer.html.erb",
    "spec/dummy/app/views/layouts/mailer.text.erb",
    "spec/dummy/app/views/recipes/_form.html.haml",
    "spec/dummy/app/views/recipes/edit.html.haml",
    "spec/dummy/app/views/recipes/index.html.haml",
    "spec/dummy/app/views/recipes/new.html.haml",
    "spec/dummy/app/views/recipes/show.html.haml",
    "spec/dummy/app/views/supplies/_form.html.haml",
    "spec/dummy/app/views/supplies/edit.html.haml",
    "spec/dummy/app/views/supplies/index.html.haml",
    "spec/dummy/app/views/supplies/new.html.haml",
    "spec/dummy/app/views/supplies/show.html.haml",
    "spec/dummy/app/views/tools/_form.html.haml",
    "spec/dummy/app/views/tools/edit.html.haml",
    "spec/dummy/app/views/tools/index.html.haml",
    "spec/dummy/app/views/tools/new.html.haml",
    "spec/dummy/app/views/tools/show.html.haml",
    "spec/dummy/bin/rails",
    "spec/dummy/bin/rake",
    "spec/dummy/bin/setup",
    "spec/dummy/config.ru",
    "spec/dummy/config/application.rb",
    "spec/dummy/config/boot.rb",
    "spec/dummy/config/cable.yml",
    "spec/dummy/config/database.yml",
    "spec/dummy/config/environment.rb",
    "spec/dummy/config/environments/development.rb",
    "spec/dummy/config/environments/production.rb",
    "spec/dummy/config/environments/test.rb",
    "spec/dummy/config/initializers/application_controller_renderer.rb",
    "spec/dummy/config/initializers/assets.rb",
    "spec/dummy/config/initializers/backtrace_silencers.rb",
    "spec/dummy/config/initializers/content_security_policy.rb",
    "spec/dummy/config/initializers/cookbook.rb",
    "spec/dummy/config/initializers/cookies_serializer.rb",
    "spec/dummy/config/initializers/devise.rb",
    "spec/dummy/config/initializers/filter_parameter_logging.rb",
    "spec/dummy/config/initializers/inflections.rb",
    "spec/dummy/config/initializers/json.rb",
    "spec/dummy/config/initializers/mime_types.rb",
    "spec/dummy/config/initializers/permissions_policy.rb",
    "spec/dummy/config/initializers/wrap_parameters.rb",
    "spec/dummy/config/locales/devise.en.yml",
    "spec/dummy/config/locales/en.yml",
    "spec/dummy/config/puma.rb",
    "spec/dummy/config/routes.rb",
    "spec/dummy/config/storage.yml",
    "spec/dummy/db/development.sqlite3",
    "spec/dummy/db/migrate/20210909175711_create_how_tos.rb",
    "spec/dummy/db/migrate/20210909181442_create_ingredients.rb",
    "spec/dummy/db/migrate/20210909181455_create_supplies.rb",
    "spec/dummy/db/migrate/20210909181516_create_tools.rb",
    "spec/dummy/db/migrate/20210909181533_create_recipes.rb",
    "spec/dummy/db/migrate/20210909185303_create_uses.cookbook.rb",
    "spec/dummy/db/migrate/20210910142322_create_users.rb",
    "spec/dummy/db/migrate/20210910142323_add_devise_to_users.rb",
    "spec/dummy/db/schema.rb",
    "spec/dummy/db/seeds.rb",
    "spec/dummy/db/test.sqlite3",
    "spec/dummy/lib/assets/.keep",
    "spec/dummy/lib/templates/haml/scaffold/_form.html.haml",
    "spec/dummy/log/.keep",
    "spec/dummy/log/development.log",
    "spec/dummy/log/test.log",
    "spec/dummy/public/404.html",
    "spec/dummy/public/422.html",
    "spec/dummy/public/500.html",
    "spec/dummy/public/apple-touch-icon-precomposed.png",
    "spec/dummy/public/apple-touch-icon.png",
    "spec/dummy/public/favicon.ico",
    "spec/dummy/storage/.keep",
    "spec/factories/how_tos.rb",
    "spec/factories/ingredients.rb",
    "spec/factories/recipes.rb",
    "spec/factories/supplies.rb",
    "spec/factories/tools.rb",
    "spec/factories/users.rb",
    "spec/factories/uses.rb",
    "spec/helpers/cookbook/application_helper_spec.rb",
    "spec/models/cookbook/use_spec.rb",
    "spec/models/how_to_spec.rb",
    "spec/models/ingredient_spec.rb",
    "spec/models/recipe_spec.rb",
    "spec/models/supply_spec.rb",
    "spec/models/tool_spec.rb",
    "spec/rails_helper.rb",
    "spec/requests/how_tos_spec.rb",
    "spec/requests/recipes_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "https://gemvein.com/museum/cases/cookbook".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Mountable Engine to show instructions with components, like a cookbook or instruction manual".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, [">= 6", "< 7"])
      s.add_runtime_dependency(%q<haml-rails>.freeze, [">= 2.0", "< 3"])
      s.add_runtime_dependency(%q<sass-rails>.freeze, [">= 5", "< 7"])
      s.add_runtime_dependency(%q<cancancan>.freeze, [">= 3.3", "< 4"])
      s.add_runtime_dependency(%q<simple_form>.freeze, [">= 5.1", "< 6"])
      s.add_runtime_dependency(%q<vanilla_nested>.freeze, [">= 1.3", "< 2"])
      s.add_development_dependency(%q<database_cleaner>.freeze, [">= 1.8", "< 2"])
      s.add_development_dependency(%q<devise>.freeze, [">= 4.8", "< 5"])
      s.add_development_dependency(%q<faker>.freeze, [">= 0"])
      s.add_development_dependency(%q<sqlite3>.freeze, [">= 1.4.2", "< 2"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 2", "< 3"])
      s.add_development_dependency(%q<factory_bot_rails>.freeze, [">= 5.1", "< 6"])
      s.add_development_dependency(%q<juwelier>.freeze, ["~> 2.1.0"])
      s.add_development_dependency(%q<puma>.freeze, [">= 4.3", "< 5"])
      s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubocop-rails>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubocop-rspec>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rails>.freeze, [">= 6", "< 7"])
      s.add_dependency(%q<haml-rails>.freeze, [">= 2.0", "< 3"])
      s.add_dependency(%q<sass-rails>.freeze, [">= 5", "< 7"])
      s.add_dependency(%q<cancancan>.freeze, [">= 3.3", "< 4"])
      s.add_dependency(%q<simple_form>.freeze, [">= 5.1", "< 6"])
      s.add_dependency(%q<vanilla_nested>.freeze, [">= 1.3", "< 2"])
      s.add_dependency(%q<database_cleaner>.freeze, [">= 1.8", "< 2"])
      s.add_dependency(%q<devise>.freeze, [">= 4.8", "< 5"])
      s.add_dependency(%q<faker>.freeze, [">= 0"])
      s.add_dependency(%q<sqlite3>.freeze, [">= 1.4.2", "< 2"])
      s.add_dependency(%q<bundler>.freeze, [">= 2", "< 3"])
      s.add_dependency(%q<factory_bot_rails>.freeze, [">= 5.1", "< 6"])
      s.add_dependency(%q<juwelier>.freeze, ["~> 2.1.0"])
      s.add_dependency(%q<puma>.freeze, [">= 4.3", "< 5"])
      s.add_dependency(%q<rubocop>.freeze, [">= 0"])
      s.add_dependency(%q<rubocop-rails>.freeze, [">= 0"])
      s.add_dependency(%q<rubocop-rspec>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>.freeze, [">= 6", "< 7"])
    s.add_dependency(%q<haml-rails>.freeze, [">= 2.0", "< 3"])
    s.add_dependency(%q<sass-rails>.freeze, [">= 5", "< 7"])
    s.add_dependency(%q<cancancan>.freeze, [">= 3.3", "< 4"])
    s.add_dependency(%q<simple_form>.freeze, [">= 5.1", "< 6"])
    s.add_dependency(%q<vanilla_nested>.freeze, [">= 1.3", "< 2"])
    s.add_dependency(%q<database_cleaner>.freeze, [">= 1.8", "< 2"])
    s.add_dependency(%q<devise>.freeze, [">= 4.8", "< 5"])
    s.add_dependency(%q<faker>.freeze, [">= 0"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 1.4.2", "< 2"])
    s.add_dependency(%q<bundler>.freeze, [">= 2", "< 3"])
    s.add_dependency(%q<factory_bot_rails>.freeze, [">= 5.1", "< 6"])
    s.add_dependency(%q<juwelier>.freeze, ["~> 2.1.0"])
    s.add_dependency(%q<puma>.freeze, [">= 4.3", "< 5"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop-rails>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop-rspec>.freeze, [">= 0"])
  end
end

