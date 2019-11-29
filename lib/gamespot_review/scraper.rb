class GamespotReview::Scraper

  def get_page_info(url)
    Nokogiri::HTML(open(url))
  end

  def get_game_info
    base_url = "https://www.gamespot.com/reviews/?page="
    page_count = 1
    total_pages = 5
    game_info = []
    total_pages.times do
      game_info << self.get_page_info(base_url + "#{page_count}").css("article.media.media-game")
      game_info.flatten!
      page_count += 1
    end
    game_info
  end

  def create_games
    self.get_game_info.each do |game_info|
      game = GamespotReview::Game.new
      game.title = game_info.css("h3.media-title").text.sub(/( R.*)/, '')
      game.score = game_info.css("span.content").text
      game.blurb = game_info.css("p.media-deck").text.strip
      game.review_url = "https://www.gamespot.com" + game_info.css("a").first["href"]
    end
    self.add_game_info
    binding.pry
  end

  def add_game_info
    GamespotReview::Game.all.each do |game|
      more_info = self.get_page_info(game.review_url)
      # game.release_console =
      game.release_date = more_info.css("ul.kubrick-info__releasedate li span").text.sub('released', '')
      game.reviewer = more_info.css("p.news-byline a").text
      game.reviewer_profile = more_info.css("p.news-byline a").empty? ? "Not available" : "https://www.gamespot.com" + more_info.css("p.news-byline a").first["href"]
      # game.review_date =
      # game.review_text =
    end
  end

  def list_games

  end

end
