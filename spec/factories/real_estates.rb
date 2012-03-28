# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :real_estate do
    possession_id 1
    real_estate_type "MyString"
    address "MyString"
    city "MyString"
    state "MyString"
    deed "MyString"
    photo "MyString"
    note "MyText"
  end
end
