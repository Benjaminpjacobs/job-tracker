FactoryGirl.define do
  sequence :name do |n|
    "Company #{n}"
  end
  
  factory :company do
    name
       factory :company_with_job do

          transient do
            jobs_count 1
          end

          after(:create) do |company, evaluator| 
            create_list(:job, evaluator.jobs_count, company: company)
          end
      end
  end
end

