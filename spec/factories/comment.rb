FactoryGirl.define do
  sequence :content do |n|
    "content #{n}"
  end

  factory :comment do
    content
    job
  end
end
