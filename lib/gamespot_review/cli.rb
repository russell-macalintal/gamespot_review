class GamespotReview::CLI

  def start
    self.greeting
    self.call_for_input
  end

  def greeting
    puts "Welcome to the Gamespot Review CLI!"
    GamespotReview::Game.create_games
    puts "This program is intended to show you information about the latest videogames that have been reviewed on Gamespot.com!"
  end

  def call_for_input
    input = nil
    while input != "exit"
      puts "Select which range of videogames you'd like to see or [exit]: "
      puts "[1]-10, [11]-20, [21]-30, [31]-40, [41]-50, [51]-60, [61]-70. [71]-80, [81]-90, [91]-100"
      input = gets.strip.downcase

      if input.to_i > 0
        list_games(input.to_i)
      elsif input == "exit"
        return
      else
        puts "Unknown command or range. Please try again.\n\n"
      end
    end

  end

  def list_games(start_range)
    if [1,11,21,31,41,51,61,71,81,91].include?(start_range)
      puts "Here is a list of games [#{start_range} - #{start_range+9}]:"
      GamespotReview::Game.list_games(start_range)

      input = gets.strip.downcase

      if input.to_i >= start_range
        show_game_info(input.to_i)
      end

    else
      puts "Invalid start range. Please type in a number shown within the [brackets]:\n\n"
    end
  end

  def show_game_info(game_selected)
    GamespotReview::Game.add_show_game_info(game_selected)
  end

  def find_by_title(title)

  end

end
