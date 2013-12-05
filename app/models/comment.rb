class Comment < ActiveRecord::Base
  include PopularSorting

  # Accessors
  attr_accessor :future_child_of

  # Use Parole
  acts_as_commentable
  acts_as_comment

  # Use Awesome Nested Set
  acts_as_nested_set

  # Use Emotions
  acts_as_emotive

  # Validations
  validates :comment, presence: true
  validates :commenter, presence: true
  validates :commentable, presence: true

  # Callbacks
  after_create :move_self_as_a_child, if: -> { future_child_of.present? }
  before_create :set_root_id
  after_create :denormalize_comments_count
  after_create :denormalize_root_comments_count

private

  def set_root_id
    if future_child_of.is_a?(Comment)
      self.root_id = self.future_child_of.root_id
      self.root_type = self.future_child_of.root_type
    else
      self.root_id = self.commentable.id
      self.root_type = self.commentable.class.to_s
    end
  end

  def move_self_as_a_child
    self.move_to_child_of(self.future_child_of) if future_child_of.is_a?(Comment)
  end

  def denormalize_comments_count
    return if self.parent.nil?

    Comment.where(id: self.ancestors.pluck(:id))
           .where('id != ?', self.parent.id)
           .update_all('comments_count = comments_count + 1')
  end

  def denormalize_root_comments_count
    comments_count = Comment.where(root_id: self.root_id).count
    root_type.constantize.find(self.root_id).update_column(:comments_count, comments_count)
  end
end
