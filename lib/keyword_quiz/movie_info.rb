module KeywordQuiz
	class MovieInfo
	
	  attr_accessor :title, :movieID, :keywords, :thumbnail
	
	  def initialize(movieID, title)
	    @movieID = movieID
	    @title = title
	    @keywords = []
	  end
	  
	end
end