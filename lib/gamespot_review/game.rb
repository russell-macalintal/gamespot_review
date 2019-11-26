class GamespotReview::Game
  attr_accessor :title, :score, :game_url, :release_console, :release_date, :reviewer, :review_date, :review_text
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end
