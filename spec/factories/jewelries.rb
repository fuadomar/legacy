# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :jewelry do
    possession_id 1
    name "MyString"
    photo "MyString"
    document "MyString"
    note "MyText"
  end
end
