require 'rails_helper'

describe "user visits dashboard" do
  scenario "and can see a count of jobs by level of interest" do
    job1, job2, job3 = create_list(:job, 3, level_of_interest: 3, company: "ESPN")
    job4, job5, job6 = create_list(:job, 3, level_of_interest: 2, company: "Sony")
    job7, job8, job9 = create_list(:job, 3, level_of_interest: 1, company: "Comcast")

    visit dashboard_path
    

  end
  
  scenario "and can see a companies ranked by interest with display" do
  end
  
  scenario "and can see a count of jobs by location" do
  end
end
