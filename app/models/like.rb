class Like < ApplicationRecord
  belongs_to :fan, class_name: "User"
  belongs_to :photo, class_name:"User"
end
