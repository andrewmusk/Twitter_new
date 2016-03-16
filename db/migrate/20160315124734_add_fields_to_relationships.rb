class AddFieldsToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :user_id, :integer
    add_column :relationships, :follower_id, :integer
    add_column :relationships, :blocked, :boolean
  end
end
