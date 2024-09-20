require 'rails_helper'

RSpec.describe "topics/edit", type: :view do
  let(:topic) {
    Topic.create!(
      title: "MyString",
      img_url: "MyString",
      content: "MyText"
    )
  }

  before(:each) do
    assign(:topic, topic)
  end

  it "renders the edit topic form" do
    render

    assert_select "form[action=?][method=?]", topic_path(topic), "post" do
      assert_select "input[name=?]", "topic[title]"

      assert_select "input[name=?]", "topic[img_url]"

      assert_select "textarea[name=?]", "topic[content]"
    end
  end
end
