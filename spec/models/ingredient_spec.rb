require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'Relationships' do
    it { should have_many(:uses) }

    it { should have_many(:recipe_uses) }
    it { should have_many(:recipes).through(:uses) }

    it { should_not have_many(:how_to_uses) }
    it { should_not have_many(:how_tos).through(:uses) }
  end
end
