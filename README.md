# Capistrano3::Ec2::Minimal

AWS SDK v2 を使って [forward3d/cap-ec2](https://github.com/forward3d/cap-ec2) の最小限の機能を実装する。

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano3-ec2-minimal'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano3-ec2-minimal

## Usage

In config/deploy.rb:

```ruby
Rake::Task[fetch(:stage)].enhance do
  ec2_set_servers user: 'ec2-user'
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/capistrano3-ec2-minimal/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
