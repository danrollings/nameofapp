class StaticPagesController < ApplicationController
    
  def landing_page
  @products = Product.limit(3)
	end
	
  def index
  	@products = Product.all
  end
end
