require 'pry'
class View

  def display_question(dis_question)
    dis_question
  end

  def correct_answers(answers, num_questions)
    puts "You correctly answered #{answers.length} out of #{num_questions.length}"
  end

end
