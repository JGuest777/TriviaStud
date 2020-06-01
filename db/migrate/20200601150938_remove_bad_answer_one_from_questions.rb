class RemoveBadAnswerOneFromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :bad_answer_one, :string
    remove_column :questions, :bad_answer_two, :string
    remove_column :questions, :score, :integer
  end
end
