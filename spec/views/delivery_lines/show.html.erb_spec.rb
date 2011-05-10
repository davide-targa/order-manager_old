require 'spec_helper'

describe "delivery_lines/show.html.erb" do
  before(:each) do
    @delivery_line = assign(:delivery_line, stub_model(DeliveryLine,
      :quantity => 1,
      :article => nil,
      :delivery => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
