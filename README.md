# GamespotReview

Welcome to the GamespotReview gem. This gem will scrape the latest 100 videogame reviews from https://www.gamespot.com/. A list will be presented to the user, who will then be able to select a particular game to find out more information about it. An in-depth summary of the information about the selected videogame such as its release date and console availability, including links to the review author's profile and to their full text review online, will then be displayed for the user's interaction.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gamespot_review'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gamespot_review

## Usage

Follow CLI prompts to select a range of recently reviewed games to display, then select a specific game to show its detailed information.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'clever-map-2803'/gamespot_review. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GamespotReview project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'clever-map-2803'/gamespot_review/blob/master/CODE_OF_CONDUCT.md).
