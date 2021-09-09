require 'rails_helper'

RSpec.describe "uses/new", type: :view do
  before(:each) do
    assign(:use, Use.new(
      use_in: nil,
      use_of: nil,
      quantity_minimum: 1.5,
      quantity_maximum: 1.5,
      unit: "MyString",
      sort: 1,
      note: "MyString",
      preparation: "MyString"
    ))
  end

  it "renders new use form" do
    render

    assert_select "form[action=?][method=?]", uses_path, "post" do

      assert_select "input[name=?]", "use[use_in_id]"

      assert_select "input[name=?]", "use[use_of_id]"

      assert_select "input[name=?]", "use[quantity_minimum]"

      assert_select "input[name=?]", "use[quantity_maximum]"

      assert_select "input[name=?]", "use[unit]"

      assert_select "input[name=?]", "use[sort]"

      assert_select "input[name=?]", "use[note]"

      assert_select "input[name=?]", "use[preparation]"
    end
  end
end
