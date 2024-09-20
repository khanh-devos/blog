require 'rails_helper'

RSpec.describe "topics/new", type: :view do
  before(:each) do
    assign(:topic, Topic.new(
      title: "MyString",
      img_url: "MyString",
      content: "MyText"
    ))
  end

  it "renders new topic form" do
    render

    assert_select "form[action=?][method=?]", topics_path, "post" do
      assert_select "input[name=?]", "topic[title]"

      assert_select "input[name=?]", "topic[img_url]"

      assert_select "textarea[name=?]", "topic[content]"
    end
  end
end
