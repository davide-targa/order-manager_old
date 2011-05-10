class OrderLinesController < ApplicationController

  def index
    @order = Order.find(params[:order_id])
    @order_lines = @order.order_lines
    @order_line = OrderLine.new(:order_id => @order.id)
  end

  def create
    @order = Order.find(params[:order_id])
    @order_line = OrderLine.new(params[:order_line])
    @order_line.order_id = @order.id
    if @order_line.save
      redirect_to order_path(@order, :notice => 'Ordine creato con successo.')
    else
      @order_line = OrderLine.new(:order_id => @order.id)
      render 'order'
    end
  end

end
