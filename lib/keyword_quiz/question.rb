#require 'movie_info'


	class Question
	  attr_accessor :keyword, :choices, :answer
	  
	  def initialize()
	    @choices = []
	  end
	  
	  def answer=(answer)
	    case answer
	        when Integer: @answer = answer
	        
	        when MovieInfo:
	          begin
	            @choices.each_with_index {|mi, index| @answer = index if mi.title = answer.title}
	          end
	    end 
	  
	  end
	end
