require 'spec_helper'

describe OrderLine do

  before do
    @model = Model.create! :code => "12345", :description => "model description",
      :articles_attributes => {"123341235435" => {:barcode => "12324312343", :size => 36}}
    @order = Order.create! :date => "01/04/2011", :expiration_date => "02/04/2011"
    @order_line_valid_params = {:model => @model.id, :size => 36, :quantity => 2, :order_id => @order.id}
  end

  describe "with valid parameters" do

    before do
      @order_line = OrderLine.create!(@order_line_valid_params)
    end
  
    it "should be created" do
      OrderLine.count.should be_eql(1)
    end
    
    it "should be present in db" do
      @db_order_line = OrderLine.first
      @db_order_line.should be_eql(@order_line)
    end

    it "should not raise errors" do
      @order_line.should have(0).errors
    end

  end

  describe "with valid" do

    describe "size" do

      before (:all) do
        @m = Model.create!(:code => "123456", :description => "model description")
      end

      CONSTANTS[:valid_numbers].each do |number|
        it "should not raise error with valid number #{number}" do
          params = {:model_id => @m.id, :barcode => number, :size => number.to_f}
          Article.create!(params)
          OrderLine.create!(@order_line_valid_params).should have(0).errors
        end
      end
    end
  end

  describe "with invalid" do

    before do
      @order_line_params = {:model => @model.id, :size => 36, :order_id => @order.id}
    end

    describe "model_id" do

      before do
        @order_line_params[:model] = 111
        @order_line = OrderLine.new(@order_line_params)
      end

      it "should raise exception" do
        lambda {
          @order_line.save
        }.should raise_exception
      end
    end

    describe "size" do
      before do
        @order_line_params[:size] = 22
        @order_line = OrderLine.create(@order_line_params)
      end

      it "should have 1 error on size if under the minimum size" do
        @order_line.should have(1).error_on(:size)
      end

      it "should have 1 error on size if over the maximum size" do
        @order_line.should have(1).error_on(:size)
      end
    end

  end
end