require 'rails_helper'

RSpec.describe "uses/show", type: :view do
  before(:each) do
    @use = assign(:use, Use.create!(
      use_in: nil,
      use_of: nil,
      quantity_minimum: 2.5,
      quantity_maximum: 3.5,
      unit: "Unit",
      sort: 4,
      note: "Note",
      preparation: "Preparation"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/Unit/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Note/)
    expect(rendered).to match(/Preparation/)
  end
end
