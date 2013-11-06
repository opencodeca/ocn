Ocnews::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'app/users/omniauth_callbacks' }

  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy'
  end

  root 'app/posts#popular'

  namespace :app, path: '' do
    resources :posts, only: [:show, :new, :create] do
      get 'newest', on: :collection, as: 'newest'
    end

    resources :users, only: [:show]
    resources :comments, only: [:show, :new, :create]
  end
end
