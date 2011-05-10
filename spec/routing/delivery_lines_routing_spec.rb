require "spec_helper"

describe DeliveryLinesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/delivery_lines" }.should route_to(:controller => "delivery_lines", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/delivery_lines/new" }.should route_to(:controller => "delivery_lines", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/delivery_lines/1" }.should route_to(:controller => "delivery_lines", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/delivery_lines/1/edit" }.should route_to(:controller => "delivery_lines", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/delivery_lines" }.should route_to(:controller => "delivery_lines", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/delivery_lines/1" }.should route_to(:controller => "delivery_lines", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/delivery_lines/1" }.should route_to(:controller => "delivery_lines", :action => "destroy", :id => "1")
    end

  end
end
