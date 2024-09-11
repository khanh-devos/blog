require 'rails_helper'

RSpec.describe "admins/new", type: :view do
  before(:each) do
    assign(:admin, Admin.new(
      username: "MyString",
      role: "MyString",
      permissions: "MyString",
      user: nil
    ))
  end

  it "renders new admin form" do
    render

    assert_select "form[action=?][method=?]", admins_path, "post" do
      assert_select "input[name=?]", "admin[username]"

      assert_select "input[name=?]", "admin[role]"

      assert_select "input[name=?]", "admin[permissions]"

      assert_select "input[name=?]", "admin[user_id]"
    end
  end
end
