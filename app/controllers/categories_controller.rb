class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.title} added!"
      redirect_to @category
    else
      render :new
    end
  end

  def index
    @categories = Category.all
  end

  def show
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = "#{@category.title} updated!"
      redirect_to @category
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:success] = "#{@category.title} was successfully deleted!"
    redirect_to categories_path
  end

  private
    def category_params
      params.require(:category).permit(:title)
    end
    
    def set_category
      @category = Category.find(params[:id])
    end
end