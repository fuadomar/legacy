# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :loan do
    financial_account_id 1
    type_of_loan "MyString"
    loan_originator "MyString"
    current_owner_of_loan "MyString"
    contact_information "MyString"
    face_value "MyString"
    current_debt "MyString"
    copy_of_loan "MyString"
    note "MyText"
  end
end
