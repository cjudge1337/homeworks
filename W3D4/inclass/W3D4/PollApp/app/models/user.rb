class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true

  has_many :authored_polls,
    class_name: "Poll",
    primary_key: :id,
    foreign_key: :user_id

  has_many :responses,
    class_name: "Response",
    primary_key: :id,
    foreign_key: :user_id

  def completed_polls
    Poll.select("polls.*, COUNT(DISTINCT questions.id) AS question_count")
      .joins(:answer_choices)
      .joins("LEFT JOIN (
      SELECT * FROM responses WHERE user_id = ?
      )AS user_responses ON answer_choices.id = user_responses.answer_id", self.id)
      .group(:id)
  end
end
