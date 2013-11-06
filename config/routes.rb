Ocnews::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'app/users/omniauth_callbacks' }

  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy'
  end

  root 'app/posts#popular'

  get  '/posts/newest', to: 'app/posts#newest'
  get  '/posts/new', to: 'app/posts#new'
  post '/posts', to: 'app/posts#create'

  get  '/posts/:id', to: 'app/posts#show', as: :posts_show

  get  '/users/:username', to: 'app/users#show', as: :users_show
end
