class GamespotReview::Game
  attr_accessor :title, :score, :blurb, :review_url, :release_console, :release_date, :reviewer, :reviewer_profile, :review_date, :review_text
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end
