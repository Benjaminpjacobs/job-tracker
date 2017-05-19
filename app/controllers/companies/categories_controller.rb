class Companies::CategoriesController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @category = Category.new
  end

 def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to new_company_job_path(params[:company_id])
    else
      render :new
    end
  end

  private

    def category_params
      params.require(:category).permit(:title)
    end
end