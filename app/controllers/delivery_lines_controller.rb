class DeliveryLinesController < ApplicationController

  def show
    @delivery_line = DeliveryLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @delivery_line }
    end
  end

  def new
    @order = Order.find(params[:order_id])
    @delivery = Delivery.find(params[:delivery_id])
    @delivery_line = DeliveryLine.new(:delivery_id => params[:delivery_id])
  end

  # GET /delivery_lines/1/edit
  def edit
    @delivery_line = DeliveryLine.find(params[:id])
  end

  # POST /delivery_lines
  # POST /delivery_lines.xml
  def create
    @delivery_line = DeliveryLine.new(params[:delivery_line])
    barcode = params[:delivery_line][:article_barcode]
    unless barcode.blank?
      @article = Article.where(:barcode => barcode).first
      @delivery_line.article_id = @article.id
    end

    respond_to do |format|
      if @delivery_line.save
        format.html { redirect_to(order_delivery_path(@delivery_line.delivery.order,@delivery_line.delivery), :notice => 'Delivery line was successfully created.') }
        format.xml  { render :xml => @delivery_line, :status => :created, :location => @delivery_line }
      else
        @delivery = @delivery_line.delivery
        @order = @delivery.order
        format.html { render :action => "new" }
        format.xml  { render :xml => @delivery_line.errors, :status => :unprocessable_entity }
      end
    end
    
  end

  # PUT /delivery_lines/1
  # PUT /delivery_lines/1.xml
  def update
    @delivery_line = DeliveryLine.find(params[:id])

    respond_to do |format|
      if @delivery_line.update_attributes(params[:delivery_line])
        format.html { redirect_to(order_delivery_path(@delivery_line.delivery.order,@delivery_line.delivery), :notice => 'Delivery line was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @delivery_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_lines/1
  # DELETE /delivery_lines/1.xml
  def destroy
    @delivery_line = DeliveryLine.find(params[:id])
    @delivery_line.destroy
    redirect_to(order_delivery_path(@delivery_line.delivery.order,@delivery_line.delivery))
  end
end
