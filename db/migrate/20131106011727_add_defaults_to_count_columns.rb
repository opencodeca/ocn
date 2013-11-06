class AddDefaultsToCountColumns < ActiveRecord::Migration
  def change
    change_column_default :posts, :comments_count, 0
    change_column_default :posts, :like_emotions_count, 0
  end
end
