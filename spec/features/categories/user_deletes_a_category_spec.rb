require 'rails_helper'

describe "from categories page" do
  scenario "user can delete a category" do
    cat1 = create(:category)

    visit categories_path

    click_link "Delete"
    
    expect(page).to have_content("#{cat1.title} was successfully deleted!")
    expect(page).to_not have_content("Edit")
  end
end

