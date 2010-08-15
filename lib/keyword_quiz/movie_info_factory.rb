module KeywordQuiz

	class MovieInfoFactory
	  
  	def getMovieInfo(movieID)
        movie = Imdb::Movie.new(movieID)
        movieInfo = KeywordQuiz::MovieInfo.new(movieID, movie.title)
        keywords = getKeywords(movieID)
        movieInfo.addKeywords keywords
        return movieInfo
  	end
  	  	
    def getKeywords(movieID)
      kwDoc = open("http://www.imdb.com/title/tt#{movieID}/keywords")
      keywordDocument = Hpricot(kwDoc)
      keywords = keywordDocument.search('a[@href^="/keyword"]')
      keywords.map { |link| link.innerHTML.strip.imdb_unescape_html } rescue []
    end
      	
 end
  	  		
end
	
	  