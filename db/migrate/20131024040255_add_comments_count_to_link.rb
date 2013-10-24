class AddCommentsCountToLink < ActiveRecord::Migration
  def change
    add_column :links, :comments_count, :integer
  end
end
