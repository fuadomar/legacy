# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :in_home_safe_or_vault do
    possession_id 1
    name "MyString"
    location "MyString"
    code "MyString"
    photo "MyString"
    note "MyText"
  end
end
