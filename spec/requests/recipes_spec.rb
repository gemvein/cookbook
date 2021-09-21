# frozen_string_literal: true

require 'rails_helper'

module Cookbook
  RSpec.describe '/recipes', type: :request do
    include Engine.routes.url_helpers
    let(:ingredient) { FactoryBot.create(:ingredient) }
    let(:tool) { FactoryBot.create(:tool) }
    let(:supply) { FactoryBot.create(:supply) }
    let(:recipe) { FactoryBot.create(:recipe) }

    # Recipe. As you add validations to Recipe, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) do
      {
        name: Faker::Book.title,
        ingredient_uses_attributes: FactoryBot.build(:use, use_of_id: ingredient.id, use_of_type: 'Ingredient'),
        tool_uses_attributes: FactoryBot.build(:use, use_of_id: tool.id, use_of_type: 'Tool'),
        supply_uses_attributes: FactoryBot.build(:use, use_of_id: supply.id, use_of_type: 'Supply')
      }
    end

    describe 'GET /show' do
      it 'renders a successful response when admin' do
        get recipe_url(recipe)
        expect(response).to be_successful
      end
    end

    describe 'GET /index' do
      before do
        recipe
      end
      it 'renders a successful response when admin' do
        get recipes_url
        expect(response).to be_successful
      end
    end

    describe 'GET /new' do
      it 'renders a successful response when admin' do
        get new_recipe_url
        expect(response).to be_successful
      end
    end

    describe 'GET /edit' do
      it 'render a successful response when admin' do
        get edit_recipe_url(recipe)
        expect(response).to be_successful
      end
    end

    describe 'POST /create' do
      context 'with valid parameters' do
        it 'creates a new Recipe' do
          expect do
            post recipes_url, params: { recipe: valid_attributes }
          end.to change(Recipe, :count).by(1)
        end

        it 'redirects to the created recipe' do
          post recipes_url, params: { recipe: valid_attributes }
          expect(response).to redirect_to(recipe_url(Recipe.last))
        end
      end
    end

    describe 'PATCH /update' do
      let(:new_attributes) do
        {
          name: 'Foo',
          ingredient_uses_attributes: {
            0 => {
              use_of_id: ingredient.id,
              use_of_type: 'Ingredient',
              note: 'Test Note'
            }
          }
        }
      end
      context 'with valid parameters' do
        it 'updates the requested recipe' do
          patch recipe_url(recipe), params: { recipe: new_attributes }
          recipe.reload
          expect(recipe.name).to eq('Foo')
          expect(recipe.ingredient_uses.last.note).to eq('Test Note')
        end

        it 'redirects to the recipe' do
          patch recipe_url(recipe), params: { recipe: new_attributes }
          recipe.reload
          expect(response).to redirect_to(recipe_url(recipe))
        end
      end
    end

    describe 'DELETE /destroy' do
      before do
        recipe # Call it up so it exists ahead of time
      end

      it 'destroys the requested recipe' do
        expect do
          delete recipe_url(recipe)
        end.to change(Recipe, :count).by(-1)
      end

      it 'redirects to the recipes list' do
        delete recipe_url(recipe)
        expect(response).to redirect_to(recipes_url)
      end
    end
  end
end
