Ocnews::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'app/users/omniauth_callbacks' }

  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy'
  end

  root 'app/posts#popular'

  namespace :app, path: '' do

    # /rss will always show recent posts (using /posts/newest?format=rss)
    get 'rss', :to => 'posts#newest', :defaults => { :format => :rss }

    resources :posts, only: [:show, :new, :create] do
      get 'newest', on: :collection, as: 'newest'
      get 'popular', on: :collection, as: 'popular'
      post 'like', on: :member, as: 'like'
    end

    resources :users, only: [:show, :index]
    resources :comments, only: [:show, :create] do
      post 'like', on: :member, as: 'like'
    end
  end
end
