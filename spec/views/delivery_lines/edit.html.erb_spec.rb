require 'spec_helper'

describe "delivery_lines/edit.html.erb" do
  before(:each) do
    @delivery_line = assign(:delivery_line, stub_model(DeliveryLine,
      :quantity => 1,
      :article => nil,
      :delivery => nil
    ))
  end

  it "renders the edit delivery_line form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => delivery_lines_path(@delivery_line), :method => "post" do
      assert_select "input#delivery_line_quantity", :name => "delivery_line[quantity]"
      assert_select "input#delivery_line_article", :name => "delivery_line[article]"
      assert_select "input#delivery_line_delivery", :name => "delivery_line[delivery]"
    end
  end
end
