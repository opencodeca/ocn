Ocnews::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "app/users/omniauth_callbacks" }

  devise_scope :user do
    get "/logout" => "devise/sessions#destroy"
  end

  root 'app/posts#index'

  get  '/posts/newest' => 'app/posts#newest'
  get  '/posts/new' => 'app/posts#new'
  post '/posts/new' => 'app/posts#create'

  get  '/posts/:id' => 'app/posts#show', as: :posts_show
end
