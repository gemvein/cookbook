class IngredientsController < ApplicationController
  load_and_authorize_resource :ingredient, find_by: :slug

  # GET /ingredients
  def index
    @ingredients = @ingredients.page(params[:page])
    @page_title = 'Ingredients'
  end

  # GET /ingredients/slug
  def show
    @page_title = @ingredient.name
    @page_keywords = @ingredient.tag_list
    breadcrumb @ingredient.name, @ingredient.path
    @page_keywords = @ingredient.tag_list
  end

end
