DaveFaces::Application.routes.draw do
  root to: "home#index"

  resource :faces
end
