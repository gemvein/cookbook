# frozen_string_literal: true

require 'rails_helper'

describe 'Cookbook' do
  it 'should return correct version string' do
    Cookbook.version_string.should == "Cookbook version #{Cookbook::VERSION}"
  end
end
