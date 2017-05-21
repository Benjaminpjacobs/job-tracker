class JobsController < ApplicationController
  def index
    if params["location"]
      @jobs = Job.jobs_in_city(params["location"])
    elsif params["sorted"] == "location"
      @jobs = Job.group_by_city
      elsif params["location"]
    else
      @jobs = Job.group_by_interest
    end
  end
end
