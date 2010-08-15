require "spec"
require File.dirname(__FILE__) + '/../lib/keyword_quiz.rb'

describe "Keyword::Quiz" do

  describe "creating a new quiz" do
    it "should create a quiz with a description and no questions" do
  
      aQuiz = KeywordQuiz::Quiz.new('a title')
      aQuiz.questions.length.should eql 0
      
      describe "adding a question to a quiz" do      
        it "should now have one question in quiz" do     
          questionOne = KeywordQuiz::Question.new()
          aQuiz.addQuestion questionOne
          aQuiz.questions.length.should eql 1
        end                
      end
        
    end # end it should create quiz 
          
  end # end desc create new quiz
  
end # end desc Keyword:Quiz


    