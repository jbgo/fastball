module Fastball
  class CLI
    attr_reader :argv

    HELP = <<-DESC
      usage: fastball COMMAND [options]

      Fastball is the safest, fastest way to build and deploy dynamic applications.

      Commands:
        config - generate config files from erb templates

      Examples:
        fastball config
    DESC

    def initialize(argv)
      @argv = argv
      @command = argv.shift
    end

    def self.help_text
      HELP.gsub(/^ {6}/, '')
    end

    def help_text
      self.class.help_text
    end

    def run
      case @command
      when 'config'
        Fastball::Config.generate
      when 'help'
        puts help_text
      else
        puts help_text
        exit 1
      end
    end

  end
end
