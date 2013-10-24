class Comment < ActiveRecord::Base
  # Use Parole
  acts_as_commentable
  acts_as_comment
end
