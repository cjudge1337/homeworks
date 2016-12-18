# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Post < ActiveRecord::Base
  validates :title, :user_id, presence: true
  # validates :subs, presence: true

  belongs_to :author, class_name: :User, foreign_key: :user_id
  # belongs_to :subject, class_name: :Sub, foreign_key: :sub_id

  has_many :post_subs, inverse_of: :sub
  has_many :subs, through: :post_subs, source: :sub
end
