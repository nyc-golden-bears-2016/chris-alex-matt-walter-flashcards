class FlashcardController

  def initialize(file)
    @file = file
    @model = FlashcardModel.new(file)
    @view = FlashcardView.new
    @num_of_questions = @model.parsed_file.length
    @question_num = 0
    @correct_answers = 0
    run
  end

  def controller_display
    questions = @model.ask_questions
      @view.display(questions[@question_num])
  end

  def get_user_answer
    user_answer = gets.chomp.downcase
    answer_bool = @model.check_answer(user_answer, @question_num)
    if answer_bool
      @correct_answers += 1
    end
    @view.display_answer(answer_bool)
    @question_num +=1
  end

  def run
    while @question_num < @num_of_questions
    controller_display
    get_user_answer
    end
    @view.display_total_correct(@num_of_questions, @correct_answers)
  end
end
