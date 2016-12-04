class Question < ActiveRecord::Base
  validates :text, :poll_id, presence: true

  has_many :answer_choices,
    class_name: "AnswerChoice",
    primary_key: :id,
    foreign_key: :question_id

  belongs_to :poll,
    class_name: "Poll",
    primary_key: :id,
    foreign_key: :poll_id

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results_bad
    result_counts = {}
    answer_choices.each do |answer_choice|
      result_counts[answer_choice.text] = answer_choice.responses.count
    end
    result_counts
  end

  def results_includes
    choices = answer_choices.includes(:responses)
    result_counts = {}
    choices.each do |choice|
      result_counts[choice.text] = choice.responses.length
    end
    result_counts
  end

  def results
    choices = answer_choices.select("answer_choices.text, COUNT(responses.id) as res_count")
    .joins("LEFT JOIN responses ON responses.answer_id = answer_choices.id")
    .group(:id)

    result_counts = {}
    choices.each do |choice|
      result_counts[choice.text] = choice.res_count
    end
    result_counts

  end

end
