class Post < ActiveRecord::Base
  scope :newest, lambda { |count=10| order('created_at DESC').limit(count) }

  # Use Parole
  acts_as_commentable

  # Use Emotions
  acts_as_emotive
end
