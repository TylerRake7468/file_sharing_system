Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  resources :file_uploads, only: [:index, :new, :create, :destroy] do
    member do
      get :share
    end
  end
  root "file_uploads#index"
  get "/s/:short_url", to: "file_uploads#access_via_short_url", as: :short_url
end
