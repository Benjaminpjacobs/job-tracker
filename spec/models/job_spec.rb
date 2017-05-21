require 'rails_helper'

RSpec.describe Job, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:level_of_interest) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:category) }
  end
  
  describe "associations" do
    it { should belong_to(:company) }
    it { should belong_to(:category) }
    it { should have_many(:comments) }
  end

  describe "methods" do  
    it "groups by city" do
      job1, job2, job3 = create_list(:job, 3, city: "Cleveland")
      job4, job5 = create_list(:job, 2, city: "Austin")
      result = Job.group_by_city

      expect(result.keys).to eq(['Austin', "Cleveland"])
      expect(result.values[0]).to be_kind_of(ActiveRecord::Relation)
    end

    it "groups by interest" do
      job1, job2, job3 = create_list(:job, 3, level_of_interest: 30)
      job4, job5 = create_list(:job, 2, level_of_interest: 20)
      result = Job.group_by_interest

      expect(result.keys).to eq(['Interest Level 30', 'Interest Level 20'])
      expect(result.values[0]).to be_kind_of(ActiveRecord::Relation)
    end
    
  end
  

end




