class GamespotReview::Scraper

  def get_page_info(url)
    Nokogiri::HTML(open(url))
  end

  def get_game_info
    base_url = "https://www.gamespot.com/reviews/?page="
    page_count = 1
    game_info = []
    5.times do
      game_info << self.get_page_info(base_url + "#{page_count}").css("article.media.media-game")
      game_info.flatten!
      page_count += 1
    end
    game_info
  end

  def create_games
    self.get_game_info.each do |game_info|
      game = GamespotReview::Game.new
      game.title = game_info.css("h3.media-title").text
      game.score = game_info.css("span.content").text
      game.game_url = "https://www.gamespot.com" + game_info.css("a").first["href"]
    end
  end

  def add_game_info
    GamespotReview::Game.all.each do |game|
      # game.release_console =
      # game.release_date =
      # game.reviewer =
      # game.review_date =
      # game.review_text =
    end
  end

  def list_games

  end

end
