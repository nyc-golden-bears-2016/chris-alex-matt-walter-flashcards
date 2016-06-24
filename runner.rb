require_relative 'flashcard_controller'
require_relative 'flashcard_view'
require_relative 'flashcard_model'
require 'pry'

# file = FlashcardModel.new('nighthawk_flashcard_data.txt')
# file.create_nested_array
# file.ask_questions

# new_file = FlashcardView.new
# new_file.display

flashcards = FlashcardController.new('raccoon_flashcard_data.txt')

