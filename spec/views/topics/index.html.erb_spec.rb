require 'rails_helper'

RSpec.describe "topics/index", type: :view do
  before(:each) do
    assign(:topics, [
      Topic.create!(
        title: "Title",
        img_url: "Img Url",
        content: "MyText"
      ),
      Topic.create!(
        title: "Title",
        img_url: "Img Url",
        content: "MyText"
      )
    ])
  end

  it "renders a list of topics" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Img Url".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
