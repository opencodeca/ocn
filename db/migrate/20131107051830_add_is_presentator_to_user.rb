class AddIsPresentatorToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_presentator, :boolean, default: false
  end
end
