require 'pry'

class FlashcardModel
  attr_reader :file, :answers, :parsed_file

  def initialize(file)
    @file = file
    @answers = []
    @parsed_file = []
    create_nested_array
  end

  def array_creator
    txt = File.open(file, "r+")
    file_array = txt.map do |row|
      if row == "\n"
        row = false
      end
        row
    end
    file_array
  end

  def array_chomper
    file_array = array_creator
    clean_file_array = file_array.map do |row|
      if row.class == String
        row = row.chomp
      end
      row
    end
    clean_file_array
  end

  def create_nested_array
    file_array = array_chomper
    while file_array.length > 0
      parsed_file << file_array.slice!(0..2)
    end
  end

  def ask_questions
    questions = parsed_file
    questions_arr = questions.map do |question|
      question[0]
    end
    questions_arr
  end

  def check_answer(user_answer, question_num)
    if user_answer == parsed_file[question_num][1]
      parsed_file[question_num][2] == true
      return true
    else
      return false
    end
  end
end


