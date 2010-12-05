class ModelsController < ApplicationController

  def index
    @models = Model.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @model = Model.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @model = Model.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @model = Model.find(params[:id])
  end

  def create
    @model = Model.new(params[:model])

    respond_to do |format|
      if @model.save
        format.html { redirect_to(@model, :notice => 'Model was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @model = Model.find(params[:id])

    respond_to do |format|
      if @model.update_attributes(params[:model])
        format.html { redirect_to(@model, :notice => 'Model was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @model = Model.find(params[:id])
    @model.destroy

    respond_to do |format|
      format.html { redirect_to(models_url) }
    end
  end
end
