Rails.application.routes.draw do
  root :to => "sightings#index"
  
  resources :sightings do
    collection do
      get 'search_sightings_trough_dates'
    end
  end
  
  resources :species
  
  resources :regions
  
  
  
  
  
end
