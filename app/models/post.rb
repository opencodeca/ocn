class Post < ActiveRecord::Base
  # Use Parole
  acts_as_commentable

  # Use Emotions
  acts_as_emotive

  # Associations
  belongs_to :user

  # Scopes
  scope :newest, lambda { |count=10| order('created_at DESC').limit(count) }
end
