require 'rails_helper'

describe Product do
	 context "when the product has comments" do
	 	before do
	 		@product = Product.create!(name: "Columbian")
	 		@user = FactoryGirl.create(:user)
	 		@product.comments.create!(rating: 1, user: @user, body: "Rubbish Coffee")
	 		@product.comments.create!(rating: 3, user: @user, body: "OK")
	 		@product.comments.create!(rating: 5, user: @user, body: "Great!")
	 		end
	 	
		it "should return the average rating of all comments" do
			expect(@product.average_rating).to eq 3
			expect(Product.new(description: "Nice bike")).not_to be_valid
		end
	end
end