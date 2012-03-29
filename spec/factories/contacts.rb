# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    user_id 1
    first_name "MyString"
    last_name "MyString"
    date_of_birth "2012-03-29"
    email "MyString"
    phone_number "MyString"
    address "MyText"
    comments "MyText"
  end
end
