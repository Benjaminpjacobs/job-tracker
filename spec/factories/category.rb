FactoryGirl.define do
  sequence :category_title do |n|
    "Category #{n}"
  end

  factory :category do
    title {generate(:category_title)}
    factory :category_with_job do

      transient do
        jobs_count 1
      end
      
      after(:create) do |category, evaluator|
        create_list(:job, evaluator.jobs_count, category: category)
      end
    end
  end  
end
