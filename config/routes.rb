DaveFaces::Application.routes.draw do
  root to: "home#index"

  put 'faces/:id/calibrate', to: 'faces#calibrate'
  resources :faces
end
