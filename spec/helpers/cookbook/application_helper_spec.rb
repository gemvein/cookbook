# frozen_string_literal: true

require 'rails_helper'

describe Cookbook::ApplicationHelper do
  describe '#cookbook' do
    before do
      FactoryBot.create_list(:recipe, 5)
      FactoryBot.create_list(:how_to, 5)

      FactoryBot.create_list(:ingredient, 5)
      FactoryBot.create_list(:tool, 5)
      FactoryBot.create_list(:supply, 5)

      FactoryBot.create_list(:use, 25)
    end
    before do
      allow(view).to receive(:current_ability).and_return(Ability.new(nil))
    end

    context 'returns cookbook_uses_of' do
      let(:ingredient) { Ingredient.first }
      subject { helper.cookbook_uses_of(ingredient) }
      it do
        should have_tag('ul', with: { class: 'uses_of' }) do
          with_tag(
            'li',
            with: { class: 'use_of' }
          )
        end
      end
    end

    context 'returns cookbook_used_in' do
      let(:recipe) { Recipe.first }
      subject { helper.cookbook_used_in(recipe) }
      it do
        should have_tag('ul', with: { class: 'used_in' }) do
          with_tag(
            'li',
            with: { class: 'use_in' }
          )
        end
      end
    end
  end
end
