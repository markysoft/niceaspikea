module KeywordQuiz

	class MovieInfo
	
	  attr_accessor :title, :movieID, :thumbnail
	
	  def initialize(movieID, title)
	    @movieID = movieID
	    @title = title
	    @keywords = []
	  end
	  
     def addKeywords(keywords)
       if keywords.is_a?(Array)
         @keywords += keywords
       end   
     end	  
	  
	  def listKeywords
	    @keywords.clone
	  end
	  
	end
	
end