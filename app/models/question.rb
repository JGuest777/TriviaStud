class Question < ApplicationRecord
  belongs_to :user

  validates :description, presence: true, length: { maximum: 300, minimum: 3 }
  validates :answer, presence: true, length: { maximum: 300, minimum: 3 }
  validates :bad_answer_one, presence: true, length: { maximum: 300, minimum: 3 }
  validates :bad_answer_two, presence: true, length: { maximum: 300, minimum: 3 }
  validates :category, presence: true, length: { maximum: 300, minimum: 3 }

  acts_as_taggable_on :tags

  CATEGORIES = [
    ['Soccer'],
    ['Football'],
    ['Baseball'],
    ['Surfing'],
    ['Skateboarding'],
    ['Basketball'],
    ['Hockey'],
    ['Snowboarding'],
    ['Snow Skiing'],
    ['Swimming'],
  ]
end
