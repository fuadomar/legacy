Factory.define(:user, :class => User) do |f|
  f.sequence(:first_name){|n| "Test-first#{n}"}
  f.sequence(:last_name){|n| "Test_last#{n}"}
  f.sequence(:email) { |n| "test#{n}@nascenia.com"}
  f.password "testpass"
  f.password_confirmation "testpass"
  f.created_at Time.now
  f.address 'test-mob1'
  f.date_of_birth '1987-11-09'
end

