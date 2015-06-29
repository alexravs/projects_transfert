Rails.application.routes.draw do
  root :to => "lists#index"
  
  resources :lists do
    resources :tasks, :except => [:show, :index] do
      member do
        patch 'done_true'
      end
      member do
        patch 'done_false'
      end
      
    end
  end
end
