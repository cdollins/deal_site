DealSite::Application.routes.draw do
  resources :issues

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
  end

  match '/' => 'publishers#index', :as => :root
end
