class AddUniqueIndexToFollowRequests < ActiveRecord::Migration[6.1]
  def change
    add_index :follow_requests, [:recipients, :senders], unique: true
  end
end
