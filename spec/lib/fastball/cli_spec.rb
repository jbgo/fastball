require 'spec_helper'
require 'fastball/cli'

describe "fastball cli commands" do

  describe 'config command' do
    it 'generates config files' do
      cli = Fastball::CLI.new(['config'])
      expect(Fastball::Config).to receive(:generate)
      cli.run
    end
  end

  describe 'help command' do
    it 'shows the usage banner' do
      stdout = `./bin/fastball help`
      expect(stdout).to eq(Fastball::CLI.help_text)
      expect($?.exitstatus).to eq(0)
    end
  end

  describe 'unknown commands' do
    it 'shows the usage banner' do
      stdout = `./bin/fastball gobbledygook`
      expect(stdout).to eq(Fastball::CLI.help_text)
      expect($?.exitstatus).to eq(1)
    end
  end

end
