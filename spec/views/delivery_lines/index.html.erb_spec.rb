require 'spec_helper'

describe "delivery_lines/index.html.erb" do
  before(:each) do
    assign(:delivery_lines, [
      stub_model(DeliveryLine,
        :quantity => 1,
        :article => nil,
        :delivery => nil
      ),
      stub_model(DeliveryLine,
        :quantity => 1,
        :article => nil,
        :delivery => nil
      )
    ])
  end

  it "renders a list of delivery_lines" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
