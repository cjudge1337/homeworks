class Contact < ActiveRecord::Base
  belongs_to :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :contact_shares,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: :ContactShare

  has_many :shared_users,
    through: :contact_shares,
    source: :user

  validates :name, :email, :owner, :presence => true
  validates :email, :uniqueness => {:scope => :user_id}
end