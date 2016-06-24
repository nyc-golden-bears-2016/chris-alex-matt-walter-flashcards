require 'pry'

class FlashcardModel
  attr_reader :file, :answers, :parsed_file

  def initialize(file)
    @file = file
    @answers = []
    @parsed_file = []
  end

  def array_creator
    txt = File.open(file, "r+")
    file_array = txt.map do |row|
      # binding.pry
      if row == "\n"
        row = false
      end
        row
    end
    clean_file_array = file_array.map do |row|
      if row.class == String
        row = row.chomp
      end
      row
    end
    clean_file_array
  end

  def create_nested_array
    file_array = array_creator
    while file_array.length > 0
      parsed_file << file_array.slice!(0..2)
    end
  end

  def ask_questions
    questions = parsed_file
    questions_arr = questions.map do |question|
      question[0]
    end
      p questions_arr
  end

#   def question_num
#     parsed_file.each do |question_array|
#       if question_array[0] ==
#   end
# end

  def check_answer
    user_answer = gets.chomp.downcase
    i = question_num
    if user_answer == parsed_file[i][1]
      parsed_file[i][2] == true
    end
  end

end

file = FlashcardModel.new('nighthawk_flashcard_data.txt')
file.create_nested_array
file.ask_questions
