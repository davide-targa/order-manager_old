require 'spec_helper'

describe "deliveries/show.html.erb" do
  before(:each) do
    @delivery = assign(:delivery, stub_model(Delivery,
      :order_id => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
