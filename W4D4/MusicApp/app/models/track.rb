class Track < ActiveRecord::Base
  KINDS = %w(regular, bonus)

  validates :name, :album_id, presence: true
  validates :kind, presence: true, inclusion: KINDS

  belongs_to :album
end
