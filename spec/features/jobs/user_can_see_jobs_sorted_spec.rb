require "rails_helper"

describe "user can see jobs sorted" do
  scenario "by city" do
    job1 ,job2, job3= create_list(:job, 3, city: "Austin")
    job4, job5 = create_list(:job, 2, city: "Cleveland")

    visit root_path
    click_on "Jobs"
    click_on "Sorted By Location"

    expect(current_path).to eq(jobs_path)
    expect(page.all('#city').count).to eq(2)
    expect(first('#city')).to have_content("Austin")
    expect(page.all('#city')[1]).to have_content("Cleveland")
    expect(first('#listings').all('#job').count).to eq(3)
    expect(page.all('#listings')[1].all('#job').count).to eq(2)
  end

  scenario "by level of interest" do
    job1 ,job2, job3= create_list(:job_in_city,3 ,level_of_interest: 10)
    job4, job5 = create_list(:job_in_city, 2, level_of_interest: 20)

    visit root_path
    click_on "Jobs"
    click_on "Sorted By Interest"

    expect(current_path).to eq(jobs_path)
    expect(page.all('#city').count).to eq(2)
    expect(first('#city')).to have_content("Interest Level 20")
    expect(page.all('#city')[1]).to have_content("Interest Level 10")
    expect(first('#listings').all('#job').count).to eq(2)
    expect(page.all('#listings')[1].all('#job').count).to eq(3)
  end
end


    