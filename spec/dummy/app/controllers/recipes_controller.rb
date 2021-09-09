class RecipesController < ApplicationController
  load_and_authorize_resource :recipe, find_by: :slug
  breadcrumb 'Recipes', :recipes

  # GET /users/loren/recipes
  def index
    @recipes = @recipes.page(params[:page])
    @page_title = 'Recipes'
  end

  # GET /users/loren/recipes/roman
  def show
    @page_title = "#{@recipe.name} Recipe"
    @page_keywords = @recipe.tag_list
    breadcrumb @recipe.name, @recipe.path
    @page_keywords = @recipe.tag_list
  end
end
