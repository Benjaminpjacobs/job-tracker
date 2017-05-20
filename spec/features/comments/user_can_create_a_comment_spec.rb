require 'rails_helper'

describe "When a user visits a job" do
  scenario "they can create a comment" do
    job = create(:job) 
    company = job.company
    expect(Comment.count).to eq(0)
    visit company_job_path(company, job)
    click_link "New Comment"
    
    fill_in "comment[content]", with: "initial comment"
    click_button "Create Comment"
    expect(Comment.count).to eq(1)
  end

  scenario "they cannot create a blank comment" do
    job = create(:job) 
    company = job.company
    visit company_job_path(company, job)
    click_link "New Comment"
    click_button "Create Comment"

    expect(page).to have_content("Content can't be blank")
  end
  
end

    