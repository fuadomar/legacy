# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
for i in 1..20 do
  User.create([{:first_name => 'abcd',
        :last_name => 'kjhg',
        :password => 'asdfghjkl',
        :password_confirmation => 'asdfghjkl',
        :date_of_birth => Time.now,
        :email => "asdfg#{i}@gmail.com"
      }])
end