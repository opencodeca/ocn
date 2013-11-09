class User < ActiveRecord::Base
  # Include devise modules
  devise :trackable, :omniauthable, omniauth_providers: [:github]

  # Use Emotions
  acts_as_emotional

  include ::GithubConnectReady

  # Associations
  has_many :posts

  # Validations
  validates :username, presence: true

  # Fake :id for path/url helpers, eg. app_user_path(user)
  def to_param
    username
  end
end
