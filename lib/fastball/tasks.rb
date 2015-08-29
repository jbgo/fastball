require 'fastball'

namespace :fastball do

  desc "generate environment specific configuration files"
  task :config do
    Fastball::Config.generate
  end

end
