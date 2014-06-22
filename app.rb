require 'sinatra'
require 'mongo_mapper'
require File.join(File.dirname(__FILE__), '/lib/ten_percent_news')

database_config = {
  development: {
    host: 'localhost',
    port: '27017',
    db:   'ten_percent_dev'
  },
  test: {
    host: 'localhost',
    port: '27017',
    db:   'ten_percent_test'
  },
}

db_config = database_config[Sinatra::Application.environment]

configure do
  if Sinatra::Application.environment == :production
    MongoMapper.setup({'production' => {'uri' => ENV['MONGOHQ_URL']}}, 'production')
  else
    MongoMapper.connection = Mongo::Connection.new(db_config[:host], db_config[:port])
    MongoMapper.database = db_config[:db]
  end
end

get '/' do
  haml :index, locals: {stories: Story.all}
end

get '/stories/new' do
  haml :new
end

post '/stories' do
  Story.create!(params[:story])
  redirect '/'
end
