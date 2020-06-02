Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'
  resources :questions do
    resources :answers, only: [:new, :create, :show]
  end
  get 'tags/:tag', to: 'questions#index', as: :tag
end
