Rails.application.routes.draw do
  root to: 'pages#home'
  get "/", to: "pages#home"
  get "/coreprinciples", to: "pages#coreprinciples"
  get "/about", to: "pages#about"
  get "/organization", to: "pages#organization"
  get "/myprofile", to: "pages#myprofile"
  get "/pianos", to: "pianos#index"
  get "/becomeamember", to: "pages#getmembership"
  get "/blog", to: "articles#index"
  get "/membersarea", to: "articles#membersarea"
  match '/users/:id', to: 'users#show', via: 'get'
  get '/user' => "pages#getmembership", :as => :user_root

  devise_for :users, :path_prefix => 'd'
  resources :articles
  resources :users, only: [:show]
  resources :memberships, only: [:index, :show]
  resources :orders, only: [:show, :create] do
  resources :payments, only: :new
  end
  
  resources :stripe_webhook, path: '/', only: [] do

    collection do

      post :stripe

    end

  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
