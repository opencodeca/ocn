class AddAwesomeNestedSetToComment < ActiveRecord::Migration
  def change
    add_column :comments, :lft, :integer
    add_column :comments, :rgt, :integer
    add_column :comments, :depth, :integer
    add_column :comments, :parent_id, :integer
  end
end
