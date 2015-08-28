# pitstop

The safest, fastest way to build and deploy dynamic applications.

## Installation

Install the gem to your system gems. Do not put it in your Gemfile.

```ruby
gem install pitstop
```

## App setup

For each application you want to build and deploy with pitstop,
run the following command to setup the application.

```
pitstop init
```

This will add the following files to your repository:

- `pitstop.yml` - for storing metadata to configure the build and deploy tasks
- `app_config.yml.example` - an example of `app_config.yml` - pitstop expects config management tools to inject this file before invoking the `pitstop:deploy`

It will also add the following tasks to your application's Rakefile.
If you're app doesn't have a Rakefile, pitstop will create one for you.

- `pitstop:configure` - renders config files from templates stored in the project repo using the values provided in `app_config.yml`
- `pitstop:build` - runs pitstop's build tasks, these can be customized in `pitstop.yml`
- `pitstop:deploy` - runs pitstop's deploy tasks, these can also be customized in `pitstop.yml`

## Production requirements

pitstop does not need to be installed on production servers to
work and it is recommended practice that you do not. The only
requirement of your production servers is that you are using a
distro that provides a somewhat up to date ruby version (we
currently support ruby 1.9.3+).

This is because most of what pitstop does is install rake tasks
to control the building and deployment of your application.

## The pitstop.yml file

```
---
app_name: myapp

build:
  pre_tasks:
    - "db:setup"
    - bundle
  test_tasks:
    - rspec
  post_tasks:
    - pitstop:tarball
  uploads:
    provider: rs_cloud_files
    container: builds
    folder: apps/myapp

deploy:
  # Commands to run before updating :current_path symlink
  pre_tasks:
    - "pitstop:configure"
    - "db:migrate"
    - "pitstop:symlink"

  # Commands to run after updating :current_path symlink
  post_tasks:
    - "pitstop:restart"

  # These are the default paths
  app_path: "/srv/:app_name"
  release_path: "/srv/:app_name/releases/:release_number"
  shared_path: "/srv/:app_name/shared"
  current_path: "/srv/:app_name/current"

  # Symlinks to create with the pitstop:symlink task
  symlinks:
    - { src: ":shared_path/log", dest: ":release_path/log" }
    - { src: ":shared_path/tmp", dest: ":release_path/tmp" }
    - { src: ":release_path/config/sidekiq.conf", dest: "/etc/init/app_name_:sidekiq.conf" }

  # Services to restart with the `pitstop:restart` task.
  # pitstop assumes you are using one of the support init systems
  services:
    - unicorn
    - sidekiq
    - { name: nginx, command: reload }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/pitstop.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

