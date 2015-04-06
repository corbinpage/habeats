require 'rails_helper'

RSpec.describe "procedures/show", :type => :view do
  before(:each) do
    @procedure = assign(:procedure, Procedure.create!(
      :name => "Name",
      :slug => "Slug",
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(/Type/)
  end
end
