class JobsController < ApplicationController
  def index
    if params["sorted"] == "location"
      @jobs = Job.group_by_city
    else
      @jobs = Job.group_by_interest
    end
  end
end
