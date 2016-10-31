require 'rails_helper'

describe UsersController, :type => :controller do

  #let(:user1) { User.create!(email: 'D2an@Dan.com', password: 'Password1') }
  #let(:user2) { User.create!(email: '2@2.com', password: 'Password2') }

  let(:user1) { @user = FactoryGirl.create(:user) }
  let(:user2) { @user = FactoryGirl.create(:user) }


  describe 'GET #show' do
     context 'User is logged in' do
     	before do
     		sign_in user1
     	end
     	it 'loads correct user details' do
     		get :show, id: user1.id
     		expect(response).to have_http_status(200)
     		expect(assigns(:user)).to eq user1
     end

     context 'Wrong user is loged in' do
       	it 'redirects to login' do
         	get :show, id: user2.id
       		expect(response).to redirect_to(root_path)
       	end
    	end
  end

	context 'No user is logged in' do
       it 'redirects to login' do
         get :show, id: user1.id
         expect(response).to redirect_to(root_path)
       end
     end
  end

end