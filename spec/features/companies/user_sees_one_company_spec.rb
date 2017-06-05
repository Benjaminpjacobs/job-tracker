require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    company = create(:company)
    job = create(:job)
    company.jobs << job

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("#{company.name}")
    expect(page).to have_content("#{job.title}")
  end
end
