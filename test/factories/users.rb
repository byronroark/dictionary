FactoryGirl.define do
  factory :user do
    email "something@example.com"
    password "long_password"
    password_confirmation "long_password"
  end
end
