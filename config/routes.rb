Rails.application.routes.draw do

  #first line starts with Bloccit::Application on Topics & Posts checkoint instead of Rails.application
  devise_for :users
  resources :users, only: [:update]
  resources :topics do
    resources :posts, except: [:index]
  end
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
