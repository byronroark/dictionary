FactoryGirl.define do
  factory :definition do
    sequence(:word) do |n|
       "Word#{n}"
     end
    sequence(:word_type) do |n|
       "Word type#{n}"
     end
    sequence(:meaning) do |n|
       "Meaning#{n}"
    end
  end
end
