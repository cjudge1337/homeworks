class User < ActiveRecord::Base
  has_many :contacts,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Contact

  validates :username, :presence => true, :uniqueness => true
end
