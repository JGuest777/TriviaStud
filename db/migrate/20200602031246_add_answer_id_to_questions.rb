class AddAnswerIdToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :answer_id, :integer
  end
end
