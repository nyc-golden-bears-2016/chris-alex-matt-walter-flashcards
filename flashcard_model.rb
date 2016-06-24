require 'pry'

class FlashcardModel
  attr_reader :file, :answers, :parsed_file

  def initialize(file)
    @file = file
    @answers = []
    @parsed_file = []
    create_nested
  end

  def flashcard_creator
    txt = File.open(file, "r+")
    file = txt.map do |row|
      row = row.chomp
      if row == ""
        row = false
      end
        row
    end
    file
  end

  def create_nested
    file = flashcard_creator
    while file.length > 0
      parsed_file << file.slice!(0..2)
    end
  end

  def ask_questions
    flashcard_info = parsed_file
    flashcard_questions = flashcard_info.map do |question|
      question[0]
    end
    flashcard_questions
  end

  def answer_correct?(user_answer, question_num)
    user_answer == parsed_file[question_num][1]
  end
end


