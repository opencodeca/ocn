class AddLikeEmotionsCountToLinks < ActiveRecord::Migration
  def change
    add_column :links, :like_emotions_count, :integer
  end
end
