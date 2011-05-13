class ModelsController < ApplicationController

  def index
  	#params[:term] ? @models = Model.where("code LIKE ?", "%#{params[:term]}%") : @models = Model.all
    @order = Order.find(params[:order_id])
    @models = @order.models
    @model = Model.new
  end

  def show
    @order = Order.find(params[:order_id])
    @model = @order.models.where(:code => params[:model]).first
    respond_to do |format|
      format.js
    end
  end

  def create
    @order = Order.find(params[:order_id])
    @model = Model.new(params[:model])
    @model.order_id = @order.id
    
    if @model.save
      redirect_to(order_models_path(@order,@model), :notice => 'Model was successfully created.')
    else
      @models = Model.where(params[:order_id])
      puts "\n\n\n#{@models.inspect}\n\n\n"
      render "index"
    end
  end
  
  def edit
    @order = Order.find(params[:order_id])
    @model = Model.find(params[:id])
  end

  def update
    @order = Order.find(params[:order_id])
    @model = Model.find(params[:id])

    if @model.update_attributes(params[:model])
      redirect_to(order_models_path(@order), :notice => 'Model was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @order = Order.find(params[:order_id])
    @model = Model.find(params[:id])
    @model.destroy

    respond_to do |format|
      format.html { redirect_to(order_models_path(@order)) }
    end
  end

  def search
    @order = Order.find(params[:order_id])
    @models = Model.where("code like ?","%#{params[:term]}%").where(:order_id => @order.id)
  end

end