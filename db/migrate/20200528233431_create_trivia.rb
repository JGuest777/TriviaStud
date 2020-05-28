class CreateTrivia < ActiveRecord::Migration[6.0]
  def change
    create_table :trivia do |t|
      t.string :question
      t.string :answer
      t.string :bad_answer_one
      t.string :bad_answer_two
      t.boolean :is_correct
      t.integer :score
      t.string :category
      t.integer :user_id
      t.timestamps
    end
  end
end