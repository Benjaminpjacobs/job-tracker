require 'rails_helper'

describe "From the company jobs page" do
  scenario "a user can update a new job" do
    company = create(:company_with_job)
    job = company.jobs.first
    new_title = "New title"
    new_description = "Description 2"
    
    visit company_path(company)
    save_and_open_page
    click_button "Edit"

    fill_in "job[title]", with: new_title
    fill_in "job[description]", with: new_description

    click_button "Update"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("#{company.name}")
    expect(page).to have_content(new_title)
    expect(page).to have_content(new_description)
    expect(page).to have_content("#{job.city}")
    expect(page).to have_content("#{job.level_of_interest}")
  end
end
