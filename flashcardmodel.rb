require 'pry'
require_relative 'cards'
class FlashcardModel
attr_reader :parsed_file, :file, :answers

  def initialize(file)
    @file = file
    @answers = []
    @parsed_file = []
  end

  def parse_txt
    parse_hash = []
    parsed_array = []
    File.open(file, "r") do |f|
      f.each_line.with_index do |line, index|
        parsed_array << line.chomp
       end
     end
    parsed_array.each_slice(3) {|str| parse_hash << str}
    parse_hash.map do |array|
      if array.include?("")
        array.pop
      end
    end
    # parse_hash.each do |item|
     parse_hash.each do |hash|
      hash.each do |question, answer|
        parsed_file << Card.new(question, answer)
    end
  end
    p parsed_file
   end

  def create_card
      parsed_file
  end
   def check_answers
    parsed_file.each do |hash|
      hash.each do |question, answer|
        puts question
        input_answer = gets.chomp
        if answer == input_answer
          puts "Corret!"
          answers << answer
        else
          puts "Wrong!"
        end
      end
    end
   end

   def next_card

   end

   def correct?(card, answer)

   end
end
test = FlashcardModel.new('otter_flashcard_data.txt')
test.parse_txt
