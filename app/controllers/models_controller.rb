class ModelsController < ApplicationController

  def index
  	#params[:term] ? @models = Model.where("code LIKE ?", "%#{params[:term]}%") : @models = Model.all
    @order = Order.find(params[:order_id])
    @models = @order.models
    @model = Model.new
  end

  def create
    @order = Order.find(params[:order_id])
    @model = Model.new(params[:model])
    @model.order_id = @order.id
    
    if @model.save
      redirect_to(order_models_path(@order,@model), :notice => 'Model was successfully created.')
    else
      @models = Model.where(params[:order_id])
      render "models/index"
    end
  end
  
  def edit
    @order = Order.find(params[:order_id])
    @model = Model.find(params[:id])
  end

  

  def update
    @order = Order.find(params[:order_id])
    @model = Model.find(params[:id])

    respond_to do |format|
      if @model.update_attributes(params[:model])
        format.html { redirect_to(order_models_path(@order), :notice => 'Model was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
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

end