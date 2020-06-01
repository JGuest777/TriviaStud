Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'
  resources :questions do
    resources :answers, only: :create
  end
  get 'tags/:tag', to: 'questions#index', as: :tag
end
