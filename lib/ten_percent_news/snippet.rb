class Snippet
  include MongoMapper::EmbeddedDocument

  key :picture_url, String
  key :picture_alt, String
  key :text,        String
  timestamps!
end
