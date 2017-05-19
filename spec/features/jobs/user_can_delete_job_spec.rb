require 'rails_helper'

describe "user can delete a job" do
  scenario "from a job show page" do
    company = create(:company_with_job, jobs_count: 2)
    job = company.jobs.first

    visit company_job_path(company, job)

    click_link "Delete"

    expect(current_path).to eq(company_jobs_path(company))
    expect(current_path).to_not have_content(job.title)
  end

   scenario "from a company show page" do
    company = create(:company_with_job, jobs_count: 1)

    job = company.jobs.first

    visit company_jobs_path(company)
    
    click_link "Delete"

    expect(current_path).to eq(company_jobs_path(company))
    expect(current_path).to_not have_content(job.title)
  end
end





