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

  def list_games

  end
end
