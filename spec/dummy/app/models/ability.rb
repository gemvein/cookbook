# frozen_string_literal: true

# Ability class for our dummy app. Used by CanCanCan to determine
# the appropriate permissions for current_ability
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
