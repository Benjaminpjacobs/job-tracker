class DashboardController < ApplicationController
  def index 
    # binding.pry
    @companies = Company.rank_by_interest
    @jobs_city = Job.jobs_per(:city).sort.to_h
    @jobs_interest= Job.jobs_per(:level_of_interest)

  end
end