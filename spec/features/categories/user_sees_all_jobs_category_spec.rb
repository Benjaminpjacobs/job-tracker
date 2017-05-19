require "rails_helper"

describe "From a category show page" do
  scenario "user can see all jobs in that category" do
    category = create(:category_with_job, jobs_count: 2)
    job1 = category.jobs.first
    job2 = category.jobs.last

    visit category_path(category)
    save_and_open_page
    expect(page).to have_content(job1.title)
    expect(page).to have_content(job2.title)
  end
end
