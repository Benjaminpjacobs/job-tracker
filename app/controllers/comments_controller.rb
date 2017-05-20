class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:job_id])
  end

  def create
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:job_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to company_job_path(@company, @job)
    end
    
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :job_id)
    end
end