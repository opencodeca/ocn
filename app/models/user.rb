class User < ActiveRecord::Base
  # Include devise modules
  devise :trackable, :omniauthable, omniauth_providers: [:github]

  # Use Emotions
  acts_as_emotional

  include ::GithubConnectReady

  # Associations
  has_many :posts
end
