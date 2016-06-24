class FlashcardView

  def display(question)
    puts "#{question}\n\n"
  end

  def display_answer(answer_bool)
    if answer_bool
      puts "\nYou are correct!\n\n"
    else
      puts "\nWrong!\n\n"
    end
  end

  def display_total_correct(num_of_questions, correct_answers)
    if correct_answers < 2
      puts "\n`|_(ツ)_/¯"
    else
      puts "\nYou answered #{correct_answers} questions out of #{num_of_questions} correctly!"
    end
  end
end
