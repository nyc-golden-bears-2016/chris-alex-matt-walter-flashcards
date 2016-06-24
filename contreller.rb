require_relative 'flashcard_view'
require_relative 'flashcardmodel'
require 'pry'
class Controller

  def initialize(file)
    @model = FlashcardModel.new(file)
    @view = View.new
    @card = Card.new
  end

  def run
    @model.parse_txt
    @view.display_question(@model.check_answers)
    @view.correct_answers(@model.answers, @model.parsed_file)
  end

end

controller = Controller.new('otter_flashcard_data.txt')
controller.run


