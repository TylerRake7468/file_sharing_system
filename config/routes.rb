Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  resources :file_uploads, only: [:index, :new, :create, :destroy] do
    member do
      get :share
    end
  end
  root "file_uploads#index"
end
