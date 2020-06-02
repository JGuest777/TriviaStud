class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  scope :available, -> (id) { where.not(user_id: id) }

  validates :description, presence: true, length: { maximum: 300, minimum: 3 }
  validates :correct_answer, presence: true, length: { maximum: 300, minimum: 3 }
  validates :category, presence: true

  acts_as_taggable_on :tags

  def self.categories
    CATEGORIES
  end

  CATEGORIES = ['Football', 'Soccer', 'Surfing', 'Basketball', 'Snowboarding', 'Swimming', 'Baseball']
end
