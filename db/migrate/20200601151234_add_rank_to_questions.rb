class AddRankToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :rank, :integer
  end
end
