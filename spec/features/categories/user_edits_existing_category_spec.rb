require "rails_helper"

describe "when user visits categories page" do
  scenario "they can edit a category" do
    cat1 = create(:category)
    cat2 = build(:category)

    visit categories_path
    click_link "Edit"

    expect(current_path).to eq(edit_category_path(cat1))

    fill_in "category[title]", with: cat2.title
    click_button "Update Category"

    expect(current_path).to eq(category_path(cat1))
    expect(page).to have_content(cat2.title)
  end

  scenario "they cannot reuse a name that exists" do
    cat1, cat2 = create_list(:category, 2)

    visit edit_category_path(cat2)

    fill_in "category[title]", with: cat1.title
    click_button "Update Category"

    expect(page).to have_content("Title has already been taken")
  end

end


    