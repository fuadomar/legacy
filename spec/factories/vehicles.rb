# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vehicle do
    possession_id 1
    manufacturrer "MyString"
    model "MyString"
    year 1
    copy_of_title "MyString"
    location_of_original_title "MyString"
    picture "MyString"
    note "MyText"
  end
end
