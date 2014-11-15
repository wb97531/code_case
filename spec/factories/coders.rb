FactoryGirl.define do
  factory :coder do
    coder_name { Faker::Name.first_name }
    password '987654321'
    password_confirmation '987654321'
    email { Faker::Internet.email }
  end
end
