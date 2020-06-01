20.times do |i|
  correct = [true, false].sample
  categories = ['Football', 'Soccer', 'Surfing', 'Basketball', 'Snowboarding', 'Swimming', 'Baseball'].sample
  users = [1, 2].sample
  question = Question.create([{
    description: Faker::Lorem.sentence,
    answer: Faker::TvShows::FamilyGuy.character,
    is_correct: correct,
    category: categories,
    question_id: '#{i}',
    user_id: users
    }])
end
