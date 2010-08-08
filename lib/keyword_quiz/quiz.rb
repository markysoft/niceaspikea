module KeywordQuiz

	class Quiz
	  
	  attr_reader :questions
	  attr_accessor :title
	  
	  def initialize(title)
	    @questions = []
	    @title = title
	  end
	  
	  def addQuestion(question)
	    if question.is_a?(Question)
	      @questions << question
	    end
	  end
	  
	end
	
end