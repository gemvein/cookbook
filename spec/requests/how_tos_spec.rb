# frozen_string_literal: true

require 'rails_helper'

module Cookbook
  RSpec.describe '/how_tos', type: :request do
    include Engine.routes.url_helpers
    let(:tool) { FactoryBot.create(:tool) }
    let(:supply) { FactoryBot.create(:supply) }
    let(:how_to) { FactoryBot.create(:how_to) }

    # HowTo. As you add validations to HowTo, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) do
      {
        name: Faker::Book.title,
        tool_uses_attributes: FactoryBot.build(:use, use_of_id: tool.id, use_of_type: 'Tool'),
        supply_uses_attributes: FactoryBot.build(:use, use_of_id: supply.id, use_of_type: 'Supply')
      }
    end

    describe 'GET /show' do
      it 'renders a successful response when admin' do
        get how_to_url(how_to)
        expect(response).to be_successful
      end
    end

    describe 'GET /index' do
      before do
        how_to
      end
      it 'renders a successful response when admin' do
        get how_tos_url
        expect(response).to be_successful
      end
    end

    describe 'GET /new' do
      it 'renders a successful response when admin' do
        get new_how_to_url
        expect(response).to be_successful
      end
    end

    describe 'GET /edit' do
      it 'render a successful response when admin' do
        get edit_how_to_url(how_to)
        expect(response).to be_successful
      end
    end

    describe 'POST /create' do
      context 'with valid parameters' do
        it 'creates a new HowTo' do
          expect do
            post how_tos_url, params: { how_to: valid_attributes }
          end.to change(HowTo, :count).by(1)
        end

        it 'redirects to the created how_to' do
          post how_tos_url, params: { how_to: valid_attributes }
          expect(response).to redirect_to(how_to_url(HowTo.last))
        end
      end
    end

    describe 'PATCH /update' do
      let(:new_attributes) do
        {
          name: 'Foo',
          tool_uses_attributes: [
            {
              use_of_id: tool.id,
              use_of_type: 'Tool',
              note: 'Test Note'
            }
          ]
        }
      end
      context 'with valid parameters' do
        it 'updates the requested how_to' do
          patch how_to_url(how_to), params: { how_to: new_attributes }
          how_to.reload
          expect(how_to.name).to eq('Foo')
          expect(how_to.tool_uses.last.note).to eq('Test Note')
        end

        it 'redirects to the how_to' do
          patch how_to_url(how_to), params: { how_to: new_attributes }
          how_to.reload
          expect(response).to redirect_to(how_to_url(how_to))
        end
      end
    end

    describe 'DELETE /destroy' do
      before do
        how_to # Call it up so it exists ahead of time
      end

      it 'destroys the requested how_to' do
        expect do
          delete how_to_url(how_to)
        end.to change(HowTo, :count).by(-1)
      end

      it 'redirects to the how_tos list' do
        delete how_to_url(how_to)
        expect(response).to redirect_to(how_tos_url)
      end
    end
  end
end
