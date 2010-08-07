require 'rubygems'
require 'imdb'
class MovieKeywords
  
  # Returns list of keyword for the movie
 
  def byId(imdb_id)
    kwDoc = open("http://www.imdb.com/title/tt#{imdb_id}/keywords")
    keywordDocument = Hpricot(kwDoc)
    keywords = keywordDocument.search('a[@href^="/keyword"]')
    keywords.map { |link| link.innerHTML.strip.imdb_unescape_html } rescue []
  end
end
