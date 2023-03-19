require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
        commenter: "Commenter",
        content: "Content"
      ),
      Comment.create!(
        commenter: "Commenter",
        content: "Content"
      )
    ])
  end

  it "renders a list of comments" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Commenter".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Content".to_s), count: 2
  end
end
