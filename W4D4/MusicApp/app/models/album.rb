class Album < ActiveRecord::Base
  RECORDINGS = %w(live studio)

  validates :name, :band_id, presence: true, uniqueness: true
  validates :recording, inclusion: RECORDINGS

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
