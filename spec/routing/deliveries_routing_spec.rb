require "spec_helper"

describe DeliveriesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/deliveries" }.should route_to(:controller => "deliveries", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/deliveries/new" }.should route_to(:controller => "deliveries", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/deliveries/1" }.should route_to(:controller => "deliveries", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/deliveries/1/edit" }.should route_to(:controller => "deliveries", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/deliveries" }.should route_to(:controller => "deliveries", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/deliveries/1" }.should route_to(:controller => "deliveries", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/deliveries/1" }.should route_to(:controller => "deliveries", :action => "destroy", :id => "1")
    end

  end
end
