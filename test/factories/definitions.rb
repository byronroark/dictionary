FactoryGirl.define do
  factory :definition do
    sequence(:word) do |sequence|
       "Word#{sequence}"
     end
     sequence(:meaning) do |sequence|
       "Meaning#{sequence}"
     end
  end
end
