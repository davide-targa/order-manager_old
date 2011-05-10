require 'spec_helper'

describe "deliveries/index.html.erb" do
  before(:each) do
    assign(:deliveries, [
      stub_model(Delivery,
        :order_id => nil
      ),
      stub_model(Delivery,
        :order_id => nil
      )
    ])
  end

  it "renders a list of deliveries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
