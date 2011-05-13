class OrdersController < ApplicationController
  
  def index
    @orders = Order.all
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      redirect_to(orders_path, :notice => 'Order was successfully created.')
    else
      @orders = Order.all
      render :action => "index"
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      redirect_to(orders_path, :notice => 'Order was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
		redirect_to(orders_url, :notice => 'Ordine eliminato con successo.')
  end
end
