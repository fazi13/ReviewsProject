Rails.application.routes.draw do
 
  devise_for :users
  
  resources :renters do
    resources :review, except: [:index, :show]
    collection do
      get 'search'
    end
  end

  root 'renters#index'
  
  match '/about_us', to: 'pages#about_us', via: :get
  match '/contact_us', to: 'pages#contact_us', via: :get
end
