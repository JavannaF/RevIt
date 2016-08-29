require 'rails_helper'

RSpec.describe "reports/index", type: :view do
  before(:each) do
    assign(:reports, [
      Report.create!(
        :review_id => 1,
        :user_id => 2,
        :comment => "Comment"
      ),
      Report.create!(
        :review_id => 1,
        :user_id => 2,
        :comment => "Comment"
      )
    ])
  end

  it "renders a list of reports" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Comment".to_s, :count => 2
  end
end
