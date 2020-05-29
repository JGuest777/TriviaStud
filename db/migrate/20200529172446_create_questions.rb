class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :description
      t.string :answer
      t.string :bad_answer_one
      t.string :bad_answer_two
      t.boolean :is_correct
      t.integer :score
      t.string :category
      t.integer :question_id
      t.integer :user_id
      t.timestamps
    end
    add_index :questions, :question_id
    add_index :questions, :user_id
  end
end
