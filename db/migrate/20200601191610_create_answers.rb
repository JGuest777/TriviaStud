class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :submitted_answer
      t.integer :user_id
      t.integer :question_id
      t.timestamps
    end
    add_index :answers, [:user_id, :question_id]
    add_index :answers, :question_id
  end
end
