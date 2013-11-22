class User < ActiveRecord::Base
  # Include devise modules
  devise :trackable, :omniauthable, omniauth_providers: [:github]

  # Use Emotions
  acts_as_emotional

  include ::GithubConnectReady
  include ::RolePlayer

  # Associations
  has_many :posts
  has_many :comments, as: :commenter

  # Validations
  validates :username, presence: true

  # Contants
  ROLES = %w{moderator speaker}

  # Fake :id for path/url helpers, eg. app_user_path(user)
  def to_param
    username
  end

  def like_post!(post)
    self.class.transaction do
      # Should definitively be located in a callback
      # but since Emotions don't provide them for now,
      # it's here.
      # https://github.com/mirego/emotions/pull/8
      raise DoubleLikeError unless express!(:like, post).newly_expressed?
      post.user.increment!(:karma)
    end
  end

  class DoubleLikeError < StandardError; end
end
