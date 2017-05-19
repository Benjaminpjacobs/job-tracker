require 'rails_helper'

describe Category do
  describe 'validations' do
    context 'invalid attributes' do
      it "is invalid if category already exists" do
        category1 = create(:category)
        category2 = Category.new(title: category1.title)

        expect(category2).to be_invalid
      end
    end
  end
end

