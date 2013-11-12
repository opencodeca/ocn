class Post < ActiveRecord::Base
  include ExternalMetadata

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
  validates :url, presence: true, http: true
  validates :title, presence: true
  validates_with PostValidator

  # Scopes
  scope :newest, lambda { order('created_at DESC') }
  scope :popular, lambda {
    limit_updated_at = 2.months.ago
    rank_select = "
      posts.*,
      round(((posts.comments_count + 3 * posts.like_emotions_count)
      /power(((extract(epoch from now()) - extract(epoch from posts.created_at))/200),0.7)
      )::numeric, 8) as rank
    ".gsub(/\s+/, " ").strip

    select(rank_select).where('updated_at >= ?', limit_updated_at).order('rank DESC')
  }
end
