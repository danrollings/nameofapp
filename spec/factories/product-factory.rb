FactoryGirl.define do
	sequence(:name) { |n| "name #{n}" }

	factory :product do
	name
	description "CoffeeCoffeeCoffee"
	image_url "products/coffee3.jpg"
	price 10
	end

	factory :badproduct do
	name
	description "CoffeeCoffeeCoffee"
	image_url "products/coffee3.jpg"
	price  "Hello"
	end

end


