class GamespotReview::Scraper

  def self.get_page_info(url)
    Nokogiri::HTML(open(url))
  end

  def self.get_game_info
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

end
