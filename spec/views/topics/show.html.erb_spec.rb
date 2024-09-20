require 'rails_helper'

RSpec.describe "topics/show", type: :view do
  before(:each) do
    assign(:topic, Topic.create!(
      title: "Title",
      img_url: "Img Url",
      content: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Img Url/)
    expect(rendered).to match(/MyText/)
  end
end
