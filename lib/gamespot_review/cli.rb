class GamespotReview::CLI

  def start
    self.greeting
    self.call_for_input
  end

  def greeting
    puts "Welcome to the Gamespot Review CLI!"
    puts "This program is intended to show you information about 105 of the latest videogames that have been reviewed on Gamespot.com"
  end

  def call_for_input
    puts "Select which range of videogames you'd like to see: [1]-9, [10]-19, [20]-29, [30]-39, [40]-49, [50]-59, [60]-69. [70]-79, [80]"
  end

  def list_games

  end

  def show_game_info

  end

end
