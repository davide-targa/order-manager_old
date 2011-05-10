class ArticlesController < ApplicationController

  def index
    @order = Order.find(params[:order_id])
    @model = Model.find(params[:model_id])
    @articles = @model.articles
    @article = Article.new(:model_id => @model.id)
  end

  def edit
    @order = Order.find(params[:order_id])
    @model = Model.find(params[:model_id])
    @article = Article.find(params[:id])
  end

  def create
    @order = Order.find(params[:order_id])
    @model = Model.find(params[:model_id])
    @articles = @model.articles
    @article = Article.new(params[:article])
    @article.model_id = @model.id

    if @article.save
      redirect_to(order_model_articles_path(@order,@model), :notice => 'Articolo salvato con successo.')
    else
      render 'articles/index'
    end
  end

  def update
    @order = Order.find(params[:order_id])
    @model = Model.find(params[:model_id])
    @articles = @model.articles
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      redirect_to(order_model_articles_path(@order,@model), :notice => 'Articolo aggiornato con successo.')
    else
      render 'edit'
    end
  end

  def destroy
    @order = Order.find(params[:order_id])
    @model = Model.find(params[:model_id])
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to(order_model_articles_path(@order,@model), :notice => 'Articolo eliminato con successo.')
    end
  end

end
