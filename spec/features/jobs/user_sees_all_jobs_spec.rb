require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    company = create(:company_with_job, jobs_count: 2)
    job = company.jobs.first
    job2 = company.jobs.last

    visit company_path(company)

    expect(page).to have_content("#{company.name}")
    expect(page).to have_content("#{job.title}")
    expect(page).to have_content("#{job2.title}")
  end
end
