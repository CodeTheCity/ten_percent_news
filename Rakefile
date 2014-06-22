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

  story = Story.new(title: 'Fire at Glasgow art school')
  story.snippets.build({
    picture_url: 'images/pic1.png',
    picture_alt: 'Glasgow School of Art',
    text: "There has been a fire in the Glasgow School of Art damaging a famous library."
  })
  story.snippets.build({
    picture_url: 'images/pic1.png',
    picture_alt: 'Glasgow School of Art',
    text: "There has been a fire in the Glasgow School of Art damaging a famous library."
  })
  story.save!

  story = Story.new(title: 'Fire at Glasgow art school')
  story.snippets.build({
    picture_url: 'images/pic1.png',
    picture_alt: 'Glasgow School of Art',
    text: "There has been a fire in the Glasgow School of Art damaging a famous library."
  })
  story.snippets.build({
    picture_url: 'images/pic1.png',
    picture_alt: 'Glasgow School of Art',
    text: "There has been a fire in the Glasgow School of Art damaging a famous library."
  })
  story.save!
end
