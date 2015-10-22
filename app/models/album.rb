# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Album < ActiveRecord::Base
    validates :name, :band_id, presence: true
  belongs_to(
    :band,
    class_name: "Band",
    foreign_key: :band_id
  )
  has_many(
    :tracks,
    class_name: "Track",
    foreign_key: :album_id
  )
end
