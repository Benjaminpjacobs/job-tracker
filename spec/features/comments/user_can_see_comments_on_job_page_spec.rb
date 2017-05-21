require 'rails_helper'

describe "When a user visits a job" do
  scenario "they can see a comment they've created" do
    comment = build(:comment) 
    job = create(:job)
    company = job.company
    visit company_job_path(company, job)
    click_link "New Comment"
    
    fill_in "comment[content]", with: comment.content
    click_button "Create Comment"

    expect(page).to have_content(comment.content)
  end

  scenario "they see the most recent comment first" do
      comment = create(:comment)
      job = comment.job
      company = job.company
      comment2 = build(:comment) 
      visit company_job_path(company, job)
      click_link "New Comment"
      
      fill_in "comment[content]", with: comment2.content
      click_button "Create Comment"
      
      expect(first('.comment')).to have_content(comment2.content)
      expect(page.all(".comment").count).to eq(2)
  end
  
end

    