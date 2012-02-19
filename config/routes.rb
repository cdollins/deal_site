DealSite::Application.routes.draw do
  resources :advertisers do
    resource :publisher
  end

  resources :publishers do
    resources :advertisers
  end
end
