require 'rails_helper'

RSpec.describe "admins/edit", type: :view do
  let(:admin) {
    Admin.create!(
      username: "MyString",
      role: "MyString",
      permissions: "MyString",
      user: nil
    )
  }

  before(:each) do
    assign(:admin, admin)
  end

  it "renders the edit admin form" do
    render

    assert_select "form[action=?][method=?]", admin_path(admin), "post" do
      assert_select "input[name=?]", "admin[username]"

      assert_select "input[name=?]", "admin[role]"

      assert_select "input[name=?]", "admin[permissions]"

      assert_select "input[name=?]", "admin[user_id]"
    end
  end
end
