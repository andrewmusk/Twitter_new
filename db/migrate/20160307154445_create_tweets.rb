class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :tweet
      t.timestamps null: false
      t.references :user, index: true, foreign_key: true
    end
  end
end
