DaveFaces::Application.routes.draw do
  root to: "home#index"

  resources :faces
end
