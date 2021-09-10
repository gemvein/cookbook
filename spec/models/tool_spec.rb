require 'rails_helper'

RSpec.describe Tool, type: :model do
  describe 'Relationships' do
    it { should have_many(:uses) }

    it { should have_many(:recipe_uses) }
    it { should have_many(:recipes).through(:uses) }

    it { should have_many(:how_to_uses) }
    it { should have_many(:how_tos).through(:uses) }
  end
end
