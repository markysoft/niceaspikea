module Enumerable
  def uniques
    inject({}) {|h,v| h[v]=h[v].to_i+1; h}.reject{|k,v| v>1}.keys
  end
end


module KeywordQuiz

	class Question
	  attr_accessor :keyword, :answer
	  
	  def initialize()
	    @choices = []
	  end
	  
     def listChoices
        #expose as clone so the array cannot be changed
        @choices.clone
     end	  
	  
     def addMovie(movieInfo)
       @choices << movieInfo
     end	  
	  
	  def answer=(answer)	          
	    if answer.is_a?(Integer)
	      setAnswerToIndexIfValidIndex answer
	    elsif answer.is_a?(MovieInfo)   
	      setAnswerToIndexOfMovie answer     
	    end	      
	  end
	  
	  def setAnswerToIndexIfValidIndex(answer)
	    if (0..@choices.length) === answer
	      @answer = answer
	    end
	  end
	  
     def setAnswerByKeyword(keyword)
       @choices.each_with_index {|mi, index| @answer = index if mi.listKeywords.include?(keyword)}  
     end	  
	  
	  def setAnswerToIndexOfMovie(movieInfo)  
	      @choices.each_with_index {|mi, index| @answer = index if mi.title = movieInfo.title}
	  end
	 
	  def getUniqueKeywords
	    all = []
	    listChoices.each { |movie| all = all + movie.listKeywords }
	    return all.uniques
	  end 
	end 

end