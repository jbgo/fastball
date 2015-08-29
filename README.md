# Fastball

The safest, fastest way to build and deploy dynamic applications.

## Installation

With bundler:

```
# In your Gemfile
gem 'fastball', require: false

# In your terminal
bundle install
```

As a gem:

```
gem install fastball
```

In your Rakefile:

```
require 'fastball/tasks'
```

Verify installation:

```
$ rake -T fastball
rake fastball:config  # generate environment specific configuration files
```

## Documentation

See {Fastball::Config} for documentation and examples of using
Fastball to generate config files.

## Roadmap

Fastball is a young, opionated project with more features under active development.

- CLI command to vendor fastball in an application so production servers do not require the fastball gem to function
- Packaging dynamic applications into a build archive with all dependencies vendored (except for the interpreter)
- Deploying build archives into a designated deployment environment

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fastball.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

