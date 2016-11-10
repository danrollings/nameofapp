
require "rails_helper"

describe ProductsController, :type => :controller do
	let(:admin) { @user = FactoryGirl.create(:admin) }
	before :each do
	sign_in admin
	  @product = FactoryGirl.create(:product) 
	end

		describe "GET #show" do
			context 'Product is shown'do
				it 'loads correct product details' do
					get :show, id: @product
					expect(assigns(:product)).to eq @product
				end

				it "renders show template" do
					get :show, id: @product
					expect(response).to render_template (:show)
					expect(response).to have_http_status(200)

				end
			end
		end

		describe "GET #new" do
			context 'assign @product to product.new'do
				it 'loads correct product details' do
     				get :new
					expect(assigns(:product)).to be_a_new(Product)
				end

				it "renders new template" do
					get :new
					expect(response).to render_template (:new)
					expect(response).to have_http_status(200)
				end
			end
		end

		describe "GET #edit" do
			context 'assigns the requested product to @product'do
				it "loads product details" do
					get :edit, id: @product
					expect(assigns(:product)).to eq @product
				end

				it "renders the :edit template" do
					get :edit, id: @product
					expect(response).to render_template :edit
				end
			end
		end

		describe "DELETE #destroy" do
			context "deletes the product from the database"do
				it "deletes correct product" do
					expect{delete :destroy, id: @product}.to change(Product, :count).by(-1)
				end

				it "redirects to the products#index" do
					delete :destroy, id: @product
					expect(response).to  redirect_to products_url
				end
			end

		end

		#describe "GET #update" do

		#end

	describe "POST #create" do
		context "Saves Product" do
			before :each do 
				@product = FactoryGirl.attributes_for(:product) 
			end
			it "recieves :save" do
				expect{ post :create, product: @product }.to change(Product, :count).by(1)
			end

			it "redirects to products#show" do
				expect{ post :create, product: @product }
			end
		end
	end
end
