require 'json'
require_relative 'book'
require_relative 'handle_input_1'
require_relative 'validator'
require_relative 'color'
require_relative 'storage'
require './game_module'
require './game_list_module'
require './authors_games'
require_relative 'album_genre_input'

# rubocop: disable Metrics
class App
  include HandleInput1
  include Validator
  include Storage
  include GameModule
  include DisplayList
  include SaveToJson
  include HandleAlbumAndGenreInput
  def initialize
    @books = []
    @labels = []
    @games = []
    @authors = []
    @albums = []
    @genres = []
    read_json_books if File.exist?('./local/books.json')
    read_json_labels if File.exist?('./local/labels.json')
    read_authors if File.exist?('./local/author.json')
    read_games if File.exist?('./local/games.json')
    read_json_musicalbum if File.exist?('./local/music_album.json')
    read_json_genre if File.exist?('./local/genre.json')
  end

  def run
    choose_options = %(
      1 - List all books
      2 - List all music albums
      3 - List all games
      4 - List all genres
      5 - List all labels
      6 - List all authors
      7 - Add a book
      8 - Add a music album
      9 - Add a game
      10- Exit
      Additional functions
      11 - Move a book to the archive
      12 - Create a new label
      13 - Assign a label to a book
      14 - Show items by label
      15 - Create a genre
      16 - Create Author
    ).split('\n')
    loop do
      puts 'Select an option'
      choose_options.map { |choose| puts choose }
      print 'Your Choice: '
      user_input = gets.chomp.to_i

      if user_input == 10
        puts 'Thank you for using this app'
        save_json
        save_games_authors
        break
      end
      puts "\n"
      options user_input
    end
  end

  def enter
    puts 'Press enter to continue'
    gets
    puts
  end

  def options(input)
    case input
    when 1
      show_books
      enter
    when 2
      list_all_albums
      enter
    when 3
      display_games
      enter
    when 4
      list_all_genres
      enter
    when 5
      show_labels
      enter
    when 6
      display_authors
      enter
    when 7
      create_book
      enter
    when 8
      add_music_album
      enter
    when 9
      game_info
      enter
    when 11
      move_book_to_archive
    when 12
      create_label_input
    when 13
      ind = ask_book_input
      puts 'Select the label to be assigned: '
      ind2 = gets.chomp.to_i
      set_label(ind, ind2 - 1)
    when 14
      show_items_by_label(show_label_items - 1)
    when 15
      create_genre
      enter
    when 16
      create_new_author
      enter
    else
      puts 'Invalid input'
      run
    end
  end
end

def main
  new_app = App.new
  puts 'Welcome to the catalog of my things!'
  new_app.run
end

# rubocop: enable Metrics
main
