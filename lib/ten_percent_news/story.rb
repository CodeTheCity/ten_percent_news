class Story
  include MongoMapper::Document

  key :title,       String
  key :picture_url, String
  key :picture_alt, String
  key :text,        String
  timestamps!
end

