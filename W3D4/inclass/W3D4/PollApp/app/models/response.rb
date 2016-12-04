class Response < ActiveRecord::Base
  validates :user_id, :answer_id, presence: true
  validate :not_duplicate_response, :author_cant_respond

  belongs_to :respondent,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id

  belongs_to :answer_choice,
    class_name: "AnswerChoice",
    primary_key: :id,
    foreign_key: :answer_id

  has_one :question,
    through: :answer_choice,
    source: :question

  has_one :poll,
    through: :question,
    source: :poll

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end

  def not_duplicate_response
    if respondent_already_answered?
      self.errors[:question] << "has already been answered by this user."
    end
  end

  def author_cant_respond
    response_poll = AnswerChoice.find(self.answer_id).poll
    if response_poll.user_id == self.user_id
      self.errors[:respondent] << "is the creator of this poll."
    end
  end

end
