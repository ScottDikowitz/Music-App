# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Track < ActiveRecord::Base
    validates :name, :album_id, presence: true
  belongs_to(
    :album,
    class_name: "Album",
    foreign_key: :album_id
  )
  has_one(
    :band,
    through: :album,
    source: :band
  )
end
