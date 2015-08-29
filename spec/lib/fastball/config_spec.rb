require 'spec_helper'

describe Fastball::Config do

  def set_pwd(dir)
    @pwd = Dir.pwd
    @app_dir = dir
    @config_paths = %w(.env config/database.yml config/secrets.yml)
    Dir.chdir @app_dir
  end

  def restore_pwd
    @config_paths.each { |p| File.unlink(p) if File.exists?(p) }
    Dir.chdir @pwd
  end

  describe '.generate' do
    context 'when app_config.yml is missing' do
      it 'raises' do
        expect(-> { Fastball::Config.generate }).to raise_error(Fastball::MissingAppConfig)
      end
    end

    context 'properly configured application' do
      before { set_pwd 'spec/fixtures/app_properly_configured' }
      after  { restore_pwd }

      it 'renders all erb templates found in the config/ dir' do
        Fastball::Config.generate

        @config_paths.each do |path|
          expect(File.read(path)).to eq(File.read(File.join('expected', path)))
        end
      end
    end

    context 'when app_config.yml is missing values' do
      before { set_pwd 'spec/fixtures/app_missing_values' }
      after { restore_pwd }

      it 'raises before writing any files' do
        expect(-> {
          Fastball::Config.generate
        }).to raise_error(NoMethodError) { |err| expect(err.to_s).to include('password') }

        @config_paths.each do |path|
          expect(File.exists? path).to be false
        end
      end
    end
  end

end
