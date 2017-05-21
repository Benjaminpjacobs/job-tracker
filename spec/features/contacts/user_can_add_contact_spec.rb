require 'rails_helper'

describe "When a user visits a company" do
  scenario "they can create a contact" do
    company = create(:company_with_job, jobs_count: 3)
    visit company_path(company)
    
    fill_in "contact[name]", with: 'Penelope Santorini'
    fill_in "contact[position]", with: 'Hiring Manager'
    fill_in "contact[email]", with: 'penelope@wooo.com'
    click_button "Create Contact"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content("Contacts")
    expect(page).to have_content('Penelope Santorini')
    expect(page).to have_content('Hiring Manager')
    expect(page).to have_content('penelope@wooo.com')
  end
end


    