class GamespotReview::Game
  attr_accessor :title, :score, :blurb, :review_url, :review_console, :release_date, :reviewer, :reviewer_profile, :review_date
  @@all = []

  def initialize
    @review_console = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create_games
    GamespotReview::Scraper.get_game_info.each do |game_info|
      game = self.new
      game.title = game_info.css("h3.media-title").text.sub(/( R.*)/, '')
      game.score = game_info.css("span.content").text
      game.blurb = game_info.css("p.media-deck").text.strip
      game.review_url = "https://www.gamespot.com" + game_info.css("a").first["href"]
      game_info.css("li.system--pill").each {|console| game.review_console << console.text}
    end
  end

  def self.add_show_game_info(game_selected)
    self.all[game_selected-1].add_attributes
    self.all[game_selected-1].show_info
  end

  def add_attributes
    more_info = GamespotReview::Scraper.get_page_info(self.review_url)
    self.release_date = more_info.css("ul.kubrick-info__releasedate li span").text.sub('released', '')
    self.reviewer = more_info.css("p.news-byline a").text
    self.reviewer_profile = more_info.css("p.news-byline a").empty? ? "Not available" : "https://www.gamespot.com" + more_info.css("p.news-byline a").first["href"]
    self.review_date = more_info.css("p.news-byline time").text.sub(/( a.*)/, '')
  end

    # self.all.each do |game|
    #   more_info = GamespotReview::Scraper.get_page_info(game.review_url)
    #   game.release_date = more_info.css("ul.kubrick-info__releasedate li span").text.sub('released', '')
    #   game.reviewer = more_info.css("p.news-byline a").text
    #   game.reviewer_profile = more_info.css("p.news-byline a").empty? ? "Not available" : "https://www.gamespot.com" + more_info.css("p.news-byline a").first["href"]
    #   game.review_date = more_info.css("p.news-byline time").text.sub(/( a.*)/, '')
    # end

  def show_info
    puts "Here is a summary of the game you have selected:"
    puts "Title:  #{self.title}"
    puts "Gamespot Score:  #{self.score}"
  end

  def self.list_games(start_range)
    GamespotReview::Game.all[start_range..start_range+9].each.with_index(start_range) do |game, index|
      puts "#{index}.  #{game.title}  ---  #{game.score}"
    end
  end

end
