FactoryGirl.define do 
	sequence :email do |n|
    "person#{n}@example.com"
  end

	factory :user do
		email 
		password "Password1"
		first_name "Dave"
		last_name "Jones"
		admin false
	end

	factory :admin, class: User do
  email 
  password "qwertyuiop"
  admin true
  first_name "Admin"
  last_name "User"
end

end