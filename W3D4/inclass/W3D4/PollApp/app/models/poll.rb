class Poll < ActiveRecord::Base
  validates :title, :user_id, presence: true

  belongs_to :author,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id

  has_many :questions,
    class_name: "Question",
    primary_key: :id,
    foreign_key: :poll_id

  has_many :answer_choices,
    through: :questions,
    source: :answer_choices

end
