class GamespotReview::CLI

  def start
    self.greeting
    self.sort_alphabetically
    self.interact
    self.farewell
  end

  def greeting
    puts "Welcome to the Gamespot Review CLI!"
    puts "This program will show you information about the latest videogames that have been reviewed on Gamespot.com!"
    puts "Loading last 100 reviews from Gamespot.com......"
    GamespotReview::Game.create_games
    puts "DONE!"
    puts "*********************************************\n\n"
  end

  def farewell
    puts "\n*********************************************"
    puts "Thank you for using the Gamespot Review CLI!"
    puts "Goodbye"
  end

  def sort_alphabetically
    input = nil
    puts "Would you like to sort the titles first by alphabetical order? " + "[y/n]".colorize(:green)
    input = gets.strip.downcase

    if input == "y" || input == "yes"
      puts "Sorting...DONE!"
      puts "SORTED BY GAME TITLE"
      GamespotReview::Game.all.sort_by! {|game| game.title}
    elsif input == "n" || input == "no"
      puts "SORTED BY LATEST RELEASE/REVIEW DATE"
      return
    elsif input == "exit"
      self.farewell
      exit
    else
      sort_alphabetically
    end
  end

  def interact
    input = nil
    while input != "exit"
      puts "---------------------------------------------"
      puts "Select the range of videogames you'd like to see or type " + "[exit]".colorize(:red) + ":"
      print "[1]".colorize(:green) + "-10, "
      print "[11]".colorize(:green) + "-20, "
      print "[21]".colorize(:green) + "-30, "
      print "[31]".colorize(:green) + "-40, "
      print "[41]".colorize(:green) + "-50, "
      print "[51]".colorize(:green) + "-60, "
      print "[61]".colorize(:green) + "-70, "
      print "[71]".colorize(:green) + "-80, "
      print "[81]".colorize(:green) + "-90, "
      puts "[91]".colorize(:green) + "-100"
      input = gets.strip.downcase

      if [1,11,21,31,41,51,61,71,81,91].include?(input.to_i)
        list_games(input.to_i)
      elsif input == "exit"
        return
      else
        puts "\nUnknown command or range.".colorize(:red) + " Please type in a number shown within the " + "[brackets]".colorize(:green) + "."
      end
    end

  end

  def list_games(start_range)
    input = nil
    while input != "back"
      GamespotReview::Game.list_games(start_range)
      puts "Enter the " + "number".colorize(:green) + " of the game you'd like to know more about, go " + "[back]".colorize(:yellow) + " to the menu, or " + "[exit]".colorize(:red) + ":"
      input = gets.strip.downcase

      if input.to_i.between?(start_range, start_range+9)
        GamespotReview::Game.add_and_show_game_info(input.to_i)
      elsif input == "back"
        return
      elsif input == "exit"
        self.farewell
        exit
      else
        puts "Invalid input.".colorize(:red) + " Please select a " + "number".colorize(:green) + " associated to a game on this list.\n"
      end
    end
  end

  # def find_by_title(title)
  # FUTURE IMPLEMENTATION
  # end

end
