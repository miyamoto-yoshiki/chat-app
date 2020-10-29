Rails.application.routes.draw do
  devise_for :users
  get 'messages/index' #ここはどうゆう意味？
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end
end
