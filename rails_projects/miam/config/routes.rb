Rails.application.routes.draw do
  #root :to => "establishments#index"
  get '/' => 'home#index'

  
  resources :users do
    member do
      put 'starts_following'
    end
  end
  
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out
  
  resources :establishments do
    member do
      put 'visited_this_place'
    end
    resources :reviews, :except => [:show, :index]
    
    
  end
 
  
  resources :owners
  
  resources :cities do
    collection do
      get 'search_cities'
    end
  
  end
end
