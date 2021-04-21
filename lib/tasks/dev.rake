task sample_data: :environment do
  p "Creating sample data"

  
  FollowRequest.destroy_all
  Like.destroy_all
  Photo.destroy_all
  # Comment.destroy_all
  User.destroy_all

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
    fr.status = ['pending', 'rejected', 'accepted'].sample
    fr.recipient_id = User.all.ids.sample
    fr.sender_id = User.all.ids.sample
    fr.save
    p fr.errors.full_messages
    p "#{fr.recipient_id} #{fr.sender_id}"

  end

  p "#{FollowRequest.count} follow requests have been created."

    12.times do
    p = Photo.new
    p.image = Faker::LoremFlickr.image
    p.caption = Faker::Movies::LordOfTheRings.location
    p.owner_id = User.all.ids.sample
    p.save
    # p "#{p.fan_id} #{p.photo_id}"
  end

  p "#{Photo.count} likes have been created."

  12.times do
    l = Like.new
    l.fan_id = User.all.ids.sample
    l.photo_id = Photo.all.ids.sample
    p l
    l.save
   # p "#{l.fan_id} #{l.photo_id}"
   p l.errors.full_messages
  end

  p "#{Like.count} likes have been created."

end