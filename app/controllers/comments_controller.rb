class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:job_id])
  end
end