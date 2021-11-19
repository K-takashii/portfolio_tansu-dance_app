Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about'

  resources :users, only:[:show, :edit, :update]
  resources :clothes
  resources :categories, only:[:index,:show]
  resources :tags do
    get 'clothes', to: 'clothes#search'
  end
end
