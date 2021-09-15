# Works Cited
Works Cited allows you to add a list of the works cited in ActiveRecord objects, to be formatted by a helper that can be added to relevant pages to format the citations like a bibliography.

Works Cited can be configured to use CanCanCan to authorize the editing of citations. This makes it easy for you to control access.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'works_cited'
```

And then execute:
```bash
$ bundle install
```

Then generate the migrations
```bash
$ rake cookbook:install:migrations
$ rake db:migrate
```

## Configuration

You will need to add access for the people who should be authorized. Cookbook uses CanCanCan for authorization. Simply add the appropriate permissions to your ability.rb file:

```ruby
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Cookbook::Use
    can :read, Recipe
    can :read, Ingredient

    return if user.new_record? # Anonymous Users leave

    # # We could have other rules in here, like:
    # can :manage, Cookbook::Use, use_of: { user_id: user.id }, use_in: { user_id: user.id }

    return unless user.admin? # Non Admin Users leave

    can :manage, Cookbook::Use
    can :manage, Recipe
    can :manage, Ingredient
  end
end
```

## Usage
Make a model ready to accept uses, such as Recipe or Instructions

```ruby
acts_as_use_of
```

Make a model a thing that gets used, such as Ingredient or Tool

```ruby
acts_as_used_in
```

Add the helpers to the relevant views

```haml
= cookbook_uses_of @ingredient
-# OR
= cookbook_used_in @recipe
```

Add the fields to your instructional forms (e.g. Recipes)

```haml
= form_for(@recipe) do |f|
  = cookbook_fields f
```

Don't forget to add the controller concern to enable nested attributes with strong parameters

```ruby
class RecipesController < ApplicationController
  include Cookbook::Params

  #...
    
  def recipe_params
    params.require(:recipe).permit(:name, :description, :serves, :meal, :instructions, cookbook_params('Recipe'))
  end
end
```

## Contributing
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## License
Copyright (c) 2021 Loren Lundgren. See LICENSE.txt for further details.