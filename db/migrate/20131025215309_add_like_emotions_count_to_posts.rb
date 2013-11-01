class AddLikeEmotionsCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :like_emotions_count, :integer
  end
end
