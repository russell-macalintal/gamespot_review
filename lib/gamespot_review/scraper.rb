class GamespotReview::Scraper

  def get_page_info(url)
    Nokogiri::HTML(open(url))
  end

  def get_game_info
    base_url = "https://www.gamespot.com/reviews/?page="
    page_count = 1
    5.times do
      game_info = self.get_page_info(base_url + "#{page_count}").css("article.media.media-game")
      self.create_games(game_info)

      # release_console = game_info.css(
      # release_date = game_info.css(
      # reviewer = game_info.css(
      # review_date = game_info.css(
      # review_text = game_info.css(
      page_count += 1
    end
  end

  def create_games(game_info)
    game_info.each do |game_info|
      game = GamespotReview::Game.new
      game.title = game_info.css("h3.media-title").text
      game.score = game_info.css("span.content").text
      game.game_url = "https://www.gamespot.com" + game_info.css("a").first["href"]
      # game.release_console =
      # game.release_date =
      # game.reviewer =
      # game.review_date =
      # game.review_text =
    end
  end

end
