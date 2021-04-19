task sample_data: :environment do
  p "Creating sample data"

  User.destroy_all
  # FollowRequest.destroy_all
  # Like.destroy_all
  # Photo.destroy_all
  # Comment.destroy_all

  12.times do
    u = User.new
    u.username = Faker::Internet.username
    u.email = "#{u.username}@email.com"
    u.password = "password"
    u.save
    p "#{u.username}"
  end

  p "#{User.count} users have been created."

  12.times do
    fr = FollowRequest.new
    fr.status = ['Approved', 'Pending', 'Denied'].sample
    fr.recipient_id = User.all.ids.sample
    fr.sender_id = User.all.ids.sample
    fr.save
    p "#{u.username}"
end

p "#{FollowRequest.count} follow requests have been created."
