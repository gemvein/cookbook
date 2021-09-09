require 'rails_helper'

RSpec.describe "uses/index", type: :view do
  before(:each) do
    assign(:uses, [
      Use.create!(
        use_in: nil,
        use_of: nil,
        quantity_minimum: 2.5,
        quantity_maximum: 3.5,
        unit: "Unit",
        sort: 4,
        note: "Note",
        preparation: "Preparation"
      ),
      Use.create!(
        use_in: nil,
        use_of: nil,
        quantity_minimum: 2.5,
        quantity_maximum: 3.5,
        unit: "Unit",
        sort: 4,
        note: "Note",
        preparation: "Preparation"
      )
    ])
  end

  it "renders a list of uses" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: 3.5.to_s, count: 2
    assert_select "tr>td", text: "Unit".to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: "Note".to_s, count: 2
    assert_select "tr>td", text: "Preparation".to_s, count: 2
  end
end
