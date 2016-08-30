require 'rails_helper'

RSpec.describe "reports/edit", type: :view do
  before(:each) do
    @report = assign(:report, Report.create!(
      :review_id => 1,
      :user_id => 1,
      :comment => "MyString"
    ))
  end

  it "renders the edit report form" do
    render

    assert_select "form[action=?][method=?]", report_path(@report), "post" do

      assert_select "input#report_review_id[name=?]", "report[review_id]"

      assert_select "input#report_user_id[name=?]", "report[user_id]"

      assert_select "input#report_comment[name=?]", "report[comment]"
    end
  end
end
