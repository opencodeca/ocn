class AddLikeEmotionsCountToComments < ActiveRecord::Migration
  def change
    add_column :comments, :like_emotions_count, :integer, default: 0
    Comment.all.each do |comment|
      comment.like_emotions_count = comment.like_about.count
      comment.save
    end
  end
end
