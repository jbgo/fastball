require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

$LOAD_PATH.unshift './lib'
require 'fastball/tasks'
