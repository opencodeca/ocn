class Post < ActiveRecord::Base
  # Use Parole
  acts_as_commentable

  # Use Emotions
  acts_as_emotive

  # Associations
  belongs_to :user

  # Validations
  validates :url,   presence: true, http: true
  validates :title, presence: true
  validates_with PostValidator

  # Scopes
  scope :newest, lambda { |count=10| order('created_at DESC').limit(count) }
  scope :popular, lambda { |count=10| select('*, (comments_count + like_emotions_count) AS score').order('score DESC').limit(count) }
end
