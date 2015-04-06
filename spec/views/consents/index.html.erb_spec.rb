require 'rails_helper'

RSpec.describe "consents/index", :type => :view do
  before(:each) do
    assign(:consents, [
      Consent.create!(
        :user_id => 1,
        :procedure_id => 2,
        :indications_complete => false,
        :benefits_complete => false,
        :risks_complete => false,
        :alternatives_complete => false,
        :description_complete => false,
        :consent_complete => false
      ),
      Consent.create!(
        :user_id => 1,
        :procedure_id => 2,
        :indications_complete => false,
        :benefits_complete => false,
        :risks_complete => false,
        :alternatives_complete => false,
        :description_complete => false,
        :consent_complete => false
      )
    ])
  end

  it "renders a list of consents" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
