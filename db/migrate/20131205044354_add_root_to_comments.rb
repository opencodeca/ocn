class AddRootToComments < ActiveRecord::Migration
  def change
    add_column :comments, :root_type, :string
    add_column :comments, :root_id, :integer
  end
end
