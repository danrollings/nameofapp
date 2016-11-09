Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user_registrations" }
  resources :products do
    resources :comments 
  end

  resources :users

  post 'payments/create'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  get 'static_pages/about'

  post 'static_pages/thank_you'

  get 'static_pages/landing_page'

  root 'static_pages#landing_page'
 
  resources :orders, only: [:index, :show, :create, :destroy]

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
