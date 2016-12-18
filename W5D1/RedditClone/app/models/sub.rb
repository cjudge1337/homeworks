# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text             not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ActiveRecord::Base
  validates :title, :description, :moderator, presence: true

  belongs_to :moderator, class_name: :User, foreign_key: :user_id
  # has_many :posts, inverse_of: :subject

  has_many :post_subs, inverse_of: :post
  has_many :posts, through: :post_subs, source: :post
end
