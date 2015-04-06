require 'rails_helper'

RSpec.describe "procedures/index", :type => :view do
  before(:each) do
    assign(:procedures, [
      Procedure.create!(
        :name => "Name",
        :slug => "Slug",
        :type => "Type"
      ),
      Procedure.create!(
        :name => "Name",
        :slug => "Slug",
        :type => "Type"
      )
    ])
  end

  it "renders a list of procedures" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
