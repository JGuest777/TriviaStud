class AddSelectedAnswerToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :selected_answer, :string
  end
end
