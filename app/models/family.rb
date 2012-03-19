class Family < Relationship
   validates :first_name, :presence => true
   validates :last_name, :presence => true
   validates :address, :presence => true
   validates :date_of_birth, :presence => true
   validates :email, :presence => true
end