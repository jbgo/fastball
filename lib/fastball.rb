require 'fastball/version'
require 'fastball/hash_dot'
require 'fastball/config'

# The safest, fastest way to build and deploy dynamic applications.
#
# See the {file:README.md README} to get started.
#
module Fastball

  # raised when app_config.yml is not present in current directory
  class MissingAppConfig < StandardError; end

  # raised when app_config.yml is missing values required by templates
  class ConfigError < StandardError; end

  class << self
    # used internally to print informational messages to stdout
    def headline(message)
      puts "\n== #{message}" unless silence_output?
    end

    # used internally to print informational messages to stdout
    def progress(message)
      puts "..... #{message}" unless silence_output?
    end

    private

    def silence_output?
      ENV['SILENCE_OUTPUT'] =~ /^(1|true)/i
    end
  end
end
