class DashboardController < ApplicationController
  def index 
    @companies = Company.rank_by_interest
    @jobs_city = Job.jobs_per(:city)
    @jobs_interest= Job.jobs_per(:level_of_interest)
  end
end