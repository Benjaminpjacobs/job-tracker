class JobsController < ApplicationController
  before_action :set_company, only: [:index, :new, :create, :edit, :destroy]
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = @company.jobs
    @contact = Contact.new
    @contacts = @company.contacts
  end

  def new
    @job = Job.new()
    @categories = Category.all
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @comments = @job.comments.order('created_at DESC')
  end

  def edit
    @categories = Category.all
  end

  def update
    if Job.update(@job.id, job_params)
      redirect_to company_job_path(@job.company, @job)
    else
      render :edit
    end

  end

  def destroy
    @job.destroy
    redirect_to @company
  end

  private

    def job_params
      params.require(:job).permit(:title, :description, :level_of_interest, :city, :id, :category_id)
    end

    def set_company
      @company = Company.find(params[:company_id])
    end

    def set_job
      @job = Job.find(params[:id])
    end
end
