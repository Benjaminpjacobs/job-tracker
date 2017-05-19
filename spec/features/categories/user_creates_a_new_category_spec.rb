require "rails_helper"

describe "User can create a new category" do
  scenario "from the new category path" do
    category = build(:category)
    visit new_category_path
   

    fill_in "category[title]", with: category.title
    click_button "Create"

    expect(current_path).to eq(category_path(Category.last))
    expect(page).to have_content(category.title)
    expect(Category.count).to eq(1)
  end
end

describe "User cannot create a new category" do
  scenario "if category already exists" do
    category1 = create(:category)
    visit new_category_path

    fill_in "category[title]", with: category1.title
    click_button "Create"

    expect(page).to have_content("Title has already been taken")
  end
end


