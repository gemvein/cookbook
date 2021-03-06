# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HowTo, type: :model do
  describe 'Relationships' do
    it { should have_many(:uses) }

    it { should_not have_many(:ingredient_uses) }
    it { should_not have_many(:ingredients).through(:ingredient_uses) }

    it { should have_many(:supply_uses) }
    it { should have_many(:supplies).through(:supply_uses) }

    it { should have_many(:tool_uses) }
    it { should have_many(:tools).through(:tool_uses) }
  end
end
