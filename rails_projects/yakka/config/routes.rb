Rails.application.routes.draw do
  
  resources :categories do
    resources :sub_categories do      
      resources :products  
    end
  end
  
  
  resources :clients do 
    resources :commandes
  end
end
