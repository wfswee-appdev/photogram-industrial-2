class AddIndexToFollowRequests < ActiveRecord::Migration[6.1]
  def change
    add_index :follow_requests, :sender
    add_index :follow_requests, :recipient
  end
end
