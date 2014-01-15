PeekCodingChallenge::Application.routes.draw do
    
  resources :activities, :only => [:create, :destroy, :index]  #basic create and destroy, no display or update yet
  resources :availabilities, :only => [:create, :destroy, :index]

  resources :bookings, :only => [:create, :destroy, :index]

  get "availabilities/search", :to => "availabilities#search" 
end
