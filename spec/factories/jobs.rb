FactoryGirl.define do
  factory :job do
    title {generate(:title)}
    description {generate(:description)}
    level_of_interest {generate(:level_of_interest)}
    city {generate(:city)}
    category
  end

  sequence :title do |n| 
    "Job #{n}"
  end

  sequence :description do |n| 
    "Description #{n}"
  end

  sequence :level_of_interest do |n| 
    n
  end

  sequence :city do |n| 
    "City #{n}"
  end

end

