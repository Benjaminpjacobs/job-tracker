class Companies::CommentsController < ApplicationController
  before_action :set_company
  before_action :set_job

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to company_job_path(@company, @job)
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :job_id)
    end

    def set_company
      @company = Company.find(params[:company_id])
    end

    def set_job
      @job = Job.find(params[:job_id])
    end
end