class DeliveriesController < ApplicationController

  def index
    @deliveries = Delivery.where(:order_id => params[:order_id])
    @order = Order.find(params[:order_id])
  end

  def show
    @order = Order.find(params[:order_id])
    @delivery = Delivery.find(params[:id])
    @delivery_line = DeliveryLine.new(:delivery_id => @delivery.id)
  end

  def new
    @delivery = Delivery.new(:order_id => params[:order_id])
  end

  # GET /deliveries/1/edit
  def edit
    @delivery = Delivery.find(params[:id])
  end

  # POST /deliveries
  # POST /deliveries.xml
  def create
    @delivery = Delivery.new(params[:delivery])

    respond_to do |format|
      if @delivery.save
        format.html { redirect_to(order_delivery_path(@delivery.order, @delivery), :notice => 'Delivery was successfully created.') }
        format.xml  { render :xml => @delivery, :status => :created, :location => @delivery }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @delivery.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @delivery = Delivery.find(params[:id])

    respond_to do |format|
      if @delivery.update_attributes(params[:delivery])
        format.html { redirect_to(order_delivery_path(@delivery.order, @delivery), :notice => 'Delivery was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @delivery.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to(order_deliveries_path(@delivery.order))
  end
end
