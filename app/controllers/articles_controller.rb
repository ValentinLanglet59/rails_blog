class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all

  end
  def show
  end
  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(strong_params)
    @article.save

    if @article.save
      flash[:notice] = 'Article created successfully'
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(strong_params)
      flash[:notice] = 'Article was edited'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      redirect_to articles_path
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def strong_params
    params.require(:article).permit(:title, :description)
  end
end
