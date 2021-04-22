task sample_data: :environment do
  p "Creating sample data"

  if Rails.env.development?
    FollowRequest.destroy_all
    Like.destroy_all
    Comment.destroy_all
    Photo.destroy_all
    User.destroy_all
  end

  12.times do
    u = User.new
    u.username = Faker::Internet.username
    u.email = "#{u.username}@email.com"
    u.password = "password"
    private = [true, false].sample
    u.save
    p "#{u.username}"
  end

  p "#{User.count} users have been created."

  users = User.all

  users.each do |first_user|
    users.each do |second_user|
      if rand < 0.75
        first_user.sent_follow_requests.create(
          recipient: second_user,
          status: FollowRequest.statuses.keys.sample
        )
      end

      if rand < 0.75
        second_user.sent_follow_requests.create(
          recipient: first_user,
          status: FollowRequest.statuses.keys.sample
        )
      end
    end
  end
  
  p "#{FollowRequest.count} follow requests have been created."

  users.each do |user|
    rand(15).times do
      photo = user.own_photos.create(
        caption: Faker::Quote.jack_handey,
        image: "https://robohash.org/#{rand(9999)}"
      )

      user.followers.each do |follower|
        if rand < 0.5
          photo.fans << follower
        end

        if rand <0.25
          photo.comments.create(
            body: Faker::Quote.jack_handey,
            author: follower
          )
        end
      end
    end
  end
  
  p "There are now #{User.count} usres."
  p "#{FollowRequest.count} follow requests."
  p "#{Photo.count} photos."
  p "#{Like.count} likes."
  p "#{Comment.count} comments."

    

# The way I did it
  # 12.times do
  #   fr = FollowRequest.new
  #   fr.status = ['pending', 'rejected', 'accepted'].sample
  #   fr.recipient_id = User.all.ids.sample
  #   fr.sender_id = User.all.ids.sample
  #   fr.save
  #   p fr.errors.full_messages
  #   p "#{fr.recipient_id} #{fr.sender_id}"

  # end

  # p "#{FollowRequest.count} follow requests have been created."

  #   12.times do
  #   p = Photo.new
  #   p.image = Faker::LoremFlickr.image
  #   p.caption = Faker::Movies::LordOfTheRings.location
  #   p.owner_id = User.all.ids.sample
  #   p.save
  #   p "#{p.image} #{p.id}"
  # end

  # p "#{Photo.count} photos have been created."

  # 12.times do
  #   l = Like.new
  #   l.fan_id = User.all.ids.sample
  #   l.photo_id = Photo.all.ids.sample
  #   p l
  #   l.save
  #  p "#{l.fan_id} #{l.photo_id}"
  #  p l.errors.full_messages
  # end

  # p "#{Like.count} likes have been created."

  # 12.times do
  #   c = Comment.new
  #   c.author_id = User.all.ids.sample
  #   c.photo_id = Photo.all.ids.sample
  #   c.body = Faker::Movies::LordOfTheRings.location
  #   p c
  #   c.save
  #  p "#{c.author_id} #{c.photo_id}"
  #  p c.errors.full_messages
  # end

  # p "#{Comment.count} comments have been created."


end