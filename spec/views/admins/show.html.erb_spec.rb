require 'rails_helper'

RSpec.describe "admins/show", type: :view do
  before(:each) do
    assign(:admin, Admin.create!(
      username: "Username",
      role: "Role",
      permissions: "Permissions",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Role/)
    expect(rendered).to match(/Permissions/)
    expect(rendered).to match(//)
  end
end
