DealSite::Application.routes.draw do
  resources :issues do
    resource :import
    resource :publisher
    resources :deal
  end

  resources :import_errors do
    resource :import
  end

  resources :imports do
    resource :publisher
    resources :import_errors
  end

  resources :advertisers do
    resource :publisher
  end

  resources :deals do
    resource :advertiser
  end

  resources :publishers do
    resources :advertisers
    resources :imports
    resources :issues
  end

  match '/' => 'publishers#index', :as => :root
end
