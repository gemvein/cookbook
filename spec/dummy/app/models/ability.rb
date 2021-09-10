# frozen_string_literal: true

# Ability class for our dummy app. Used by CanCanCan to determine
# the appropriate permissions for current_ability
class Ability
  include CanCan::Ability

  def initialize(_user)
    # user ||= User.new

    can :manage, Cookbook::Use
    can :manage, Recipe
    can :manage, Ingredient
    can %i[manage select], Tool
    can %i[manage select], Ingredient
    can %i[manage select], Supply

    # return if user.new_record? # Anonymous Users leave
    # return unless user.admin? # Non Admin Users leave
  end
end
