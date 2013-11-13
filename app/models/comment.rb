class Comment < ActiveRecord::Base
  include PopularSorting

  # Use Parole
  acts_as_commentable
  acts_as_comment

  # Use Emotions
  acts_as_emotive

  # Validations
  validates :comment, presence: true
  validates :commenter, presence: true
  validates :commentable, presence: true
end
