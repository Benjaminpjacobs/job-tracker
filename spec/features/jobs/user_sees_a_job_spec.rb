require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = create(:company_with_job)
    job = company.jobs.first
    
    visit company_job_path(company, job)

    expect(page).to have_content("#{company.name}")
    expect(page).to have_content("#{job.title}")
    expect(page).to have_content("#{job.level_of_interest}")
  end
end
