class RemoveIsPresentatorFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :is_presentator
  end
end
