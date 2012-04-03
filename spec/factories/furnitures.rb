# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :furniture do
    possession_id 1
    name "MyString"
    photo "MyString"
    document "MyString"
    note "MyText"
  end
end
