class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable

  devise :omniauthable, :omniauth_providers => [:github]

  # Use Emotions
  acts_as_emotional

  include ::GithubConnectReady
end
