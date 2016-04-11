class CreateLinkings < ActiveRecord::Migration
  def change
    create_table :linkings do |t|
      t.integer :hashtag_id
      t.integer :tweet_id
      t.timestamps null: false
    end

    add_index :linkings, :hashtag_id
    add_index :linkings, :tweet_id
  end
end
