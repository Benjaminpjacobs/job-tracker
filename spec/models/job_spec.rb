require 'rails_helper'

RSpec.describe Job, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:level_of_interest) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:category) }
  it { should belong_to(:company) }
  it { should belong_to(:category) }
  it { should have_many(:comments) }
end

