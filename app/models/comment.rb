class Comment < ActiveRecord::Base
  # Use Parole
  acts_as_commentable
  acts_as_comment

  # Scopes
  scope :popular, lambda { |count=10| order('created_at DESC').limit(count) }
end
