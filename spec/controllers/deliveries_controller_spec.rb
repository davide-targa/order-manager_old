require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe DeliveriesController do

  def mock_delivery(stubs={})
    @mock_delivery ||= mock_model(Delivery, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all deliveries as @deliveries" do
      Delivery.stub(:all) { [mock_delivery] }
      get :index
      assigns(:deliveries).should eq([mock_delivery])
    end
  end

  describe "GET show" do
    it "assigns the requested delivery as @delivery" do
      Delivery.stub(:find).with("37") { mock_delivery }
      get :show, :id => "37"
      assigns(:delivery).should be(mock_delivery)
    end
  end

  describe "GET new" do
    it "assigns a new delivery as @delivery" do
      Delivery.stub(:new) { mock_delivery }
      get :new
      assigns(:delivery).should be(mock_delivery)
    end
  end

  describe "GET edit" do
    it "assigns the requested delivery as @delivery" do
      Delivery.stub(:find).with("37") { mock_delivery }
      get :edit, :id => "37"
      assigns(:delivery).should be(mock_delivery)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created delivery as @delivery" do
        Delivery.stub(:new).with({'these' => 'params'}) { mock_delivery(:save => true) }
        post :create, :delivery => {'these' => 'params'}
        assigns(:delivery).should be(mock_delivery)
      end

      it "redirects to the created delivery" do
        Delivery.stub(:new) { mock_delivery(:save => true) }
        post :create, :delivery => {}
        response.should redirect_to(delivery_url(mock_delivery))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved delivery as @delivery" do
        Delivery.stub(:new).with({'these' => 'params'}) { mock_delivery(:save => false) }
        post :create, :delivery => {'these' => 'params'}
        assigns(:delivery).should be(mock_delivery)
      end

      it "re-renders the 'new' template" do
        Delivery.stub(:new) { mock_delivery(:save => false) }
        post :create, :delivery => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested delivery" do
        Delivery.stub(:find).with("37") { mock_delivery }
        mock_delivery.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :delivery => {'these' => 'params'}
      end

      it "assigns the requested delivery as @delivery" do
        Delivery.stub(:find) { mock_delivery(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:delivery).should be(mock_delivery)
      end

      it "redirects to the delivery" do
        Delivery.stub(:find) { mock_delivery(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(delivery_url(mock_delivery))
      end
    end

    describe "with invalid params" do
      it "assigns the delivery as @delivery" do
        Delivery.stub(:find) { mock_delivery(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:delivery).should be(mock_delivery)
      end

      it "re-renders the 'edit' template" do
        Delivery.stub(:find) { mock_delivery(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested delivery" do
      Delivery.stub(:find).with("37") { mock_delivery }
      mock_delivery.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the deliveries list" do
      Delivery.stub(:find) { mock_delivery }
      delete :destroy, :id => "1"
      response.should redirect_to(deliveries_url)
    end
  end

end
