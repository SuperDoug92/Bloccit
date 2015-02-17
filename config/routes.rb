Rails.application.routes.draw do

  get 'comments/new'

  #first line starts with Bloccit::Application on Topics & Posts checkoint instead of Rails.application
  devise_for :users
  resources :users, only: [:update]
  resources :topics do
    resources :posts, except: [:index]
  end
  
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
