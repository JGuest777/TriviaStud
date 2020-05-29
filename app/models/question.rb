class Question < ApplicationRecord
  validates :description, presence: true
  validates :answer, presence: true
  validates :bad_answer_one, presence: true
  validates :bad_answer_two, presence: true
  validates :category, presence: true
end
