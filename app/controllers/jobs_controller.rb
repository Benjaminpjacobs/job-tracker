class JobsController < ApplicationController
  def index
    @jobs = Job.group_by_city
  end
end
