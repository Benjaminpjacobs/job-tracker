require 'rails_helper'

describe "When a user visits a job" do
  scenario "they can delete a comment" do
    comment = create(:comment)
    job = comment.job 

    visit company_job_path(job.company, job)
    expect(Comment.count).to eq(1)
    first('.comment').click_on 'Delete'
    expect(page).to_not have_content(comment.content)
  end

  
end

    