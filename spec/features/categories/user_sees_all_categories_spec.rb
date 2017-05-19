require "rails_helper"

describe "User is on categories index page" do
  scenario "they can see all categories" do
    cat1, cat2, cat3 = create_list(:category, 3)

    visit categories_path

    expect(page).to have_content(cat1.title)
    expect(page).to have_content(cat2.title)
    expect(page).to have_content(cat3.title)
  end
end
