Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'
  resources :questions
  get 'tags/:tag', to: 'questions#index', as: :tag
end
