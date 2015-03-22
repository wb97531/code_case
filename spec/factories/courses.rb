FactoryGirl.define do
  factory :course do
    title "MyString"
    completion_date { Faker::Business.credit_card_expiry_date }
    certificate false
    completed false
    coder_id 1000
  end
end
