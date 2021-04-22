class AddUniqueIndexToFollowRequests < ActiveRecord::Migration[6.1]
  def change
    add_index :follow_requests, [:recipient_id, :sender_id], unique: true
  end
end
