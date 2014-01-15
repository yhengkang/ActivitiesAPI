PeekCodingChallenge::Application.routes.draw do
    
  resources :activities, :only => [:create, :destroy]  #basic create and destroy, no display or update yet

end
