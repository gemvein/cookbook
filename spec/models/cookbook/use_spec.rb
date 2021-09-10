# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cookbook::Use, type: :model do
  let(:recipe) { FactoryBot.create(:recipe) }
  let(:ingredient) { FactoryBot.create(:ingredient) }
  let(:full_use) do
    FactoryBot.create(
      :use,
      use_in: recipe,
      use_of: ingredient,
      quantity_maximum: 1,
      quantity_minimum: 0.5,
      unit: 'pinches',
      note: 'for power'
    )
  end
  let(:use_no_max_no_unit) do
    FactoryBot.create(
      :use,
      use_in: recipe,
      use_of: ingredient,
      quantity_minimum: 0.25,
      quantity_maximum: nil,
      note: 'for strength'
    )
  end
  let(:use_no_min_no_unit) do
    FactoryBot.create(
      :use,
      use_in: recipe,
      use_of: ingredient,
      quantity_minimum: nil,
      quantity_maximum: 2,
      note: 'for health'
    )
  end

  describe 'Relationships' do
    it { should belong_to(:use_of) }
    it { should belong_to(:use_in) }
  end

  describe 'Scopes' do
    describe '.recipe_uses' do
      subject { Cookbook::Use.recipe_uses }
      it { should include(full_use) }
    end
    describe '.ingredient_uses' do
      subject { Cookbook::Use.ingredient_uses }
      it { should include(full_use) }
    end
  end

  describe 'Methods' do
    describe '#quantity' do
      describe 'when min and max exist' do
        subject { full_use.quantity }
        it { should eq '0.5–1' } # ndash, not hyphen
      end
      describe 'with just min' do
        subject { use_no_max_no_unit.quantity }
        it { should eq '0.25' } # ndash, not hyphen
      end
      describe 'with just max' do
        subject { use_no_min_no_unit.quantity }
        it { should eq '2' } # ndash, not hyphen
      end
    end
    describe '#quantity and unit' do
      describe 'when unit exists' do
        subject { full_use.quantity_with_unit }
        it { should eq '0.5–1 pinches' } # ndash, not hyphen
      end
      describe 'with no unit' do
        subject { use_no_max_no_unit.quantity }
        it { should eq '0.25' } # ndash, not hyphen
      end
    end
  end
end
