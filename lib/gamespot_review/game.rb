class GamespotReview::Game
  attr_accessor :title, :score, :blurb, :review_url, :review_console, :release_date, :reviewer, :reviewer_profile, :review_date
  @@all = []

  def initialize(title, score, blurb, review_url)
    @title = title
    @score = score
    @blurb = blurb
    @review_url = review_url
    @review_console = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create_games
    GamespotReview::Scraper.get_game_info.each do |game_info|
      title = game_info.css("h3.media-title").text.sub(/( Review.*)/, '')
      score = game_info.css("span.content").text
      blurb = game_info.css("p.media-deck").text.strip
      review_url = "https://www.gamespot.com" + game_info.css("a").first["href"]
      game = self.new(title, score, blurb, review_url)
      game_info.css("li.system--pill").each do |console|
        if !game.review_console.include?(console.text)
          game.review_console << console.text
        end
      end
    end
  end

  def self.list_games(start_range)
    puts "---------------------------------------------"
    puts "GAMES [#{start_range} - #{start_range+9}]:"
    self.all[start_range-1..start_range+8].each.with_index(start_range) do |game, index|
      puts "#{index}.".ljust(5).colorize(:green) + "#{game.title}  -  #{game.score}"
    end
    puts "---------------------------------------------"
  end

  def self.add_and_show_game_info(game_selected)
    self.all[game_selected-1].add_attributes
    self.all[game_selected-1].show_info
  end

  def add_attributes
    more_info = GamespotReview::Scraper.get_page_info(@review_url)
    @release_date = more_info.css("ul.kubrick-info__releasedate li span").first.text.sub('released', '')
    @reviewer = more_info.css("p.news-byline a").text.sub(/(@.*)/, '')
    @reviewer_profile = more_info.css("p.news-byline a").empty? ? "Not available" : "https://www.gamespot.com" + more_info.css("p.news-byline a").first["href"]
    @review_date = more_info.css("p.news-byline time").text.sub(/( a.*)/, '')
  end

  def show_info
    puts "============================================="
    puts "Here is a summary of the game you have selected:"
    puts "Title:".ljust(20).colorize(:cyan) + "#{@title}"
    puts "Gamespot Score:".ljust(20).colorize(:cyan) + "#{@score}"
    puts "Release Date:".ljust(20).colorize(:cyan) + "#{@release_date}"
    puts "Reviewed For:".ljust(20).colorize(:cyan) + "#{@review_console.join(", ")}"
    puts "Reviewed By:".ljust(20).colorize(:cyan) + "#{@reviewer} (" + "#{@reviewer_profile}".colorize(:blue) + ") on #{@review_date}"
    puts "Full Review Link:".ljust(20).colorize(:cyan) + "#{@review_url}".colorize(:blue)
    puts @blurb
    puts "=============================================\n\n"
    puts "Press [ENTER] to return to the list"
    gets
  end

end
