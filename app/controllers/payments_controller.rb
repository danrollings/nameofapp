class PaymentsController < ApplicationController

	def create
  		token = params[:stripeToken]
  		# Create the charge on Stripe's servers - this will charge the user's card
  		begin
    		charge = Stripe::Charge.create(
      		:amount => @product.price.to_i*100, # amount in cents, again
      		:currency => "gbp",
      		:source => token,
      		:description => params[:stripeEmail]
    		)
  		rescue Stripe::CardError => e
    		# The card has been declined
  		end

	end

end
