require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/../app'
disable :run

require 'capybara'
require 'capybara/dsl'

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.include Capybara
end
