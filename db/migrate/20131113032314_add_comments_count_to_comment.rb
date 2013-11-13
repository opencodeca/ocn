class AddCommentsCountToComment < ActiveRecord::Migration
  def change
    add_column :comments, :comments_count, :integer, default: 0
  end
end
