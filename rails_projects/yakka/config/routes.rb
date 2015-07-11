Rails.application.routes.draw do
  
  root 'application#index'
  
  resources :categories do
    resources :sub_categories do      
      resources :products  
    end
  end
  
  
  resources :clients do 
    resources :commandes
  end
  
  get "*any" => 'application#index'
end
