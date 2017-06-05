require 'rails_helper'

describe "user visits dashboard" do
  scenario "and can see a count of jobs by level of interest" do
    company1, company2, company3 = create_list(:company, 3)
    job1, job2, job3 = create_list(:job, 3, level_of_interest: 3, company: company1)
    job4, job5= create_list(:job, 2, level_of_interest: 2, company: company2)
    job6 = create(:job, level_of_interest: 1, company: company3)

    visit dashboard_index_path
    expect(page.first('#job-interest').first(".list-group-item-heading")).to have_content('Interest Level 3')
    expect(page.first('#job-interest').first(".list-group-item-text")).to have_content(3)
  end
  
  scenario "and can see a companies ranked by interest with display" do
    company1, company2, company3 = create_list(:company, 3)
    job1, job2, job3 = create_list(:job, 3, level_of_interest: 3, company: company1)
    job4, job5= create_list(:job, 2, level_of_interest: 2, company: company2)
    job6 = create(:job, level_of_interest: 1, company: company3)


    visit dashboard_index_path
    expect(page.first('#top-companies').first(".list-group-item-heading")).to have_content(company1.name)
    expect(page.first('#top-companies').first(".list-group-item-text")).to have_content(3)

  end
  
  scenario "and can see a count of jobs by location" do
    job1, job2, job3 = create_list(:job, 3, city: "Austin" )
    job4, job5= create_list(:job, 2, city: "Boise" )
    job6 = create(:job, city: "Cleveland" )

    visit dashboard_index_path
    expect(page.first('#job-city').first(".list-group-item-heading")).to have_content("Austin")
    expect(page.first('#job-city').first(".list-group-item-text")).to have_content(3)


  end
end
