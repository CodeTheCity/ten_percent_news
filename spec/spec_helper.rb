require 'bundler/setup'

require 'sinatra'
Sinatra::Application.environment = :test
Bundler.require :default, Sinatra::Application.environment

Sinatra::Application.root = File.dirname(__FILE__) + '/..'

require Sinatra::Application.root + '/app'
disable :run

require 'rspec'

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.include Capybara::DSL
end

