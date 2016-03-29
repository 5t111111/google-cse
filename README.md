# Google::CSE

Easy to get some Google CSE results including search ranks and index count.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'google-cse'
```

And then execute:

``` text
$ bundle
```

Or install it yourself as:

``` text
$ gem install google-cse
```

## Usage

__Getting Search ranks__

```ruby
client = Google::SearchRank.new(api_key: "xxxx", cse_id: "xxxx")
rank = client.find("KEYWORD", %r{http://example.com/.*})
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/5t111111/google-cse/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Thanks

[google-search_rank](https://github.com/komagata/google-search_rank)
