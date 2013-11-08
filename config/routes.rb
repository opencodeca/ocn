Ocnews::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'app/users/omniauth_callbacks' }

  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy'
  end

  root 'app/posts#popular'

  namespace :app, path: '' do
    resources :posts, only: [:show, :new, :create] do
      get 'newest', on: :collection, as: 'newest'
      post 'like', on: :member, as: 'like'
    end

    resources :users, only: [:show, :index]
    resources :comments, only: [] do
      post 'like', on: :member, as: 'like'
    end
  end
end
