require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe DeliveryLinesController do

  def mock_delivery_line(stubs={})
    @mock_delivery_line ||= mock_model(DeliveryLine, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all delivery_lines as @delivery_lines" do
      DeliveryLine.stub(:all) { [mock_delivery_line] }
      get :index
      assigns(:delivery_lines).should eq([mock_delivery_line])
    end
  end

  describe "GET show" do
    it "assigns the requested delivery_line as @delivery_line" do
      DeliveryLine.stub(:find).with("37") { mock_delivery_line }
      get :show, :id => "37"
      assigns(:delivery_line).should be(mock_delivery_line)
    end
  end

  describe "GET new" do
    it "assigns a new delivery_line as @delivery_line" do
      DeliveryLine.stub(:new) { mock_delivery_line }
      get :new
      assigns(:delivery_line).should be(mock_delivery_line)
    end
  end

  describe "GET edit" do
    it "assigns the requested delivery_line as @delivery_line" do
      DeliveryLine.stub(:find).with("37") { mock_delivery_line }
      get :edit, :id => "37"
      assigns(:delivery_line).should be(mock_delivery_line)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created delivery_line as @delivery_line" do
        DeliveryLine.stub(:new).with({'these' => 'params'}) { mock_delivery_line(:save => true) }
        post :create, :delivery_line => {'these' => 'params'}
        assigns(:delivery_line).should be(mock_delivery_line)
      end

      it "redirects to the created delivery_line" do
        DeliveryLine.stub(:new) { mock_delivery_line(:save => true) }
        post :create, :delivery_line => {}
        response.should redirect_to(delivery_line_url(mock_delivery_line))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved delivery_line as @delivery_line" do
        DeliveryLine.stub(:new).with({'these' => 'params'}) { mock_delivery_line(:save => false) }
        post :create, :delivery_line => {'these' => 'params'}
        assigns(:delivery_line).should be(mock_delivery_line)
      end

      it "re-renders the 'new' template" do
        DeliveryLine.stub(:new) { mock_delivery_line(:save => false) }
        post :create, :delivery_line => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested delivery_line" do
        DeliveryLine.stub(:find).with("37") { mock_delivery_line }
        mock_delivery_line.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :delivery_line => {'these' => 'params'}
      end

      it "assigns the requested delivery_line as @delivery_line" do
        DeliveryLine.stub(:find) { mock_delivery_line(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:delivery_line).should be(mock_delivery_line)
      end

      it "redirects to the delivery_line" do
        DeliveryLine.stub(:find) { mock_delivery_line(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(delivery_line_url(mock_delivery_line))
      end
    end

    describe "with invalid params" do
      it "assigns the delivery_line as @delivery_line" do
        DeliveryLine.stub(:find) { mock_delivery_line(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:delivery_line).should be(mock_delivery_line)
      end

      it "re-renders the 'edit' template" do
        DeliveryLine.stub(:find) { mock_delivery_line(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested delivery_line" do
      DeliveryLine.stub(:find).with("37") { mock_delivery_line }
      mock_delivery_line.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the delivery_lines list" do
      DeliveryLine.stub(:find) { mock_delivery_line }
      delete :destroy, :id => "1"
      response.should redirect_to(delivery_lines_url)
    end
  end

end
