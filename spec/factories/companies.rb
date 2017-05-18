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
          
          after(:create) do |company| 
            company.jobs << create(:job)
          end
      end
  end
end

