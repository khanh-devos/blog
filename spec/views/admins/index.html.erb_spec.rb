require 'rails_helper'

RSpec.describe "admins/index", type: :view do
  before(:each) do
    assign(:admins, [
      Admin.create!(
        username: "Username",
        role: "Role",
        permissions: "Permissions",
        user: nil
      ),
      Admin.create!(
        username: "Username",
        role: "Role",
        permissions: "Permissions",
        user: nil
      )
    ])
  end

  it "renders a list of admins" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Username".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Role".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Permissions".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
