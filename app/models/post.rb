class Post < ActiveRecord::Base
  include ExternalMetadata
  include PopularSorting

  # Use Parole
  acts_as_commentable

  # Use Emotions
  acts_as_emotive

  # Use FriendlyId
  extend FriendlyId
  friendly_id :title, use: :slugged

  # Associations
  belongs_to :user

  # Validations
  validates :url, http: true
  validates :url, fresh_url: true, on: :create
  validates :title, presence: true
  validates_with PostValidator

  # Scopes
  scope :newest, lambda { order('created_at DESC') }

  def virgin?
    (like_emotions_count - 1) + comments.count <= 0
  end
end
