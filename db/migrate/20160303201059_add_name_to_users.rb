class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :phone_number, :string
    add_column :users, :date_of_birth, :datetime
    add_column :users, :user_bio, :string
    add_column :users, :followers, :integer
    add_column :users, :following, :integer
    add_column :users, :is_female, :boolean, default: false
    add_column :users, :country, :string
  end
end
