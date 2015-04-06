require 'rails_helper'

RSpec.describe "consents/new", :type => :view do
  before(:each) do
    assign(:consent, Consent.new(
      :user_id => 1,
      :procedure_id => 1,
      :indications_complete => false,
      :benefits_complete => false,
      :risks_complete => false,
      :alternatives_complete => false,
      :description_complete => false,
      :consent_complete => false
    ))
  end

  it "renders new consent form" do
    render

    assert_select "form[action=?][method=?]", consents_path, "post" do

      assert_select "input#consent_user_id[name=?]", "consent[user_id]"

      assert_select "input#consent_procedure_id[name=?]", "consent[procedure_id]"

      assert_select "input#consent_indications_complete[name=?]", "consent[indications_complete]"

      assert_select "input#consent_benefits_complete[name=?]", "consent[benefits_complete]"

      assert_select "input#consent_risks_complete[name=?]", "consent[risks_complete]"

      assert_select "input#consent_alternatives_complete[name=?]", "consent[alternatives_complete]"

      assert_select "input#consent_description_complete[name=?]", "consent[description_complete]"

      assert_select "input#consent_consent_complete[name=?]", "consent[consent_complete]"
    end
  end
end
