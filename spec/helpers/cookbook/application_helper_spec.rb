# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Layout/LineLength
describe Cookbook::ApplicationHelper do
  # let(:doodad) { FactoryBot.create(:doodad) }
  # let(:citation) { FactoryBot.create(:cookbook_citation, record: doodad) }

  pending '#cookbook' do
    before do
      FactoryBot.create_list(:recipe, 15)
    end

    context 'returns list' do
      before(:each) do
        allow(view).to receive(:current_ability).and_return(Ability.new(nil))
      end
      subject { helper.cookbook_list(doodad) }
      it do
        should have_tag('ul', with: { class: 'citations' }) do
          with_tag(
            'li',
            with: { class: 'citation' }
          )
        end
      end
    end
  end
end
# rubocop:enable Layout/LineLength
