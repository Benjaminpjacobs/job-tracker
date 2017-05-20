require 'rails_helper'

describe "When a user visits a job" do
  scenario "they can create a comment" do
    job = create(:job) 
    company = job.company

    visit company_job_path(company, job)
    click_link "New Comment"
    fill_in "comment[content]", with: "initial comment"
    click_button "Create"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("initial comment")
  end
end

    