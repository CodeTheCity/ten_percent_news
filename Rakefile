require 'rubygems'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new do |task|
  task.rspec_opts = ["-c", "-f progress", "-r ./spec/spec_helper.rb"]
  task.pattern    = 'spec/**/*_spec.rb'
end if RSpec

require 'mongo_mapper'
require File.join(File.dirname(__FILE__), '/lib/ten_percent_news')

desc "Add some stories to the db"
task :add_stories do
  if ENV && ENV['MONGOHQ_URL']
    MongoMapper.setup({'production' => {'uri' => ENV['MONGOHQ_URL']}}, 'production')
  else
    MongoMapper.connection = Mongo::Connection.new('localhost', '27017')
    MongoMapper.database = 'ten_percent_dev'
  end

  Story.destroy_all

  story = Story.new(title: 'My story')
  story.snippets.build({
    picture_url: 'images/cat.jpg',
    picture_alt: 'A cat',
    text: "This is a cat. I like cats. The whole internet likes cats."
  })
  story.snippets.build({
    picture_url: 'images/dog.jpg',
    picture_alt: 'A puppy',
    text: "This is a puppy. I like puppies. If you don't puppies then you are probably dead inside."
  })
  story.save!
end
