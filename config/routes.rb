Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :contacts do
    member do
      get :versions, to: 'contacts#versions'
    end
  end
end
