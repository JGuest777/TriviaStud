9.times do |i|
  Question.create(
    description: "Question #{i + 1}",
    answer: "This is the #{i + 1} correct answer!",
    bad_answer_one: "Not the #{i + 1} right answer.",
    bad_answer_two: "This is also not the #{i + 1} right answer.",
    category: 'sports'
  )
end
