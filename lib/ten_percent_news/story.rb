class Story
  include MongoMapper::Document

  key :title, String
  timestamps!

  many :snippets
end

