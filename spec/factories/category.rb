FactoryGirl.define do
  factory :category do
    title {generate(:category_title)}
    factory :category_with_job do

      trasient do
        jobs_count 1
      end
      
      after(:create) do |category, evaluator|
        create_list(:job, evaluator.jobs_count, category: category)
  end

  sequence :category_title do |n|
    "Category #{n}"
  end
  

end
