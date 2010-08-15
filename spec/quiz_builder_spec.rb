require "spec"
require File.dirname(__FILE__) + '/../lib/keyword_quiz.rb'

describe "KeywordQuiz::QuizBuilder" do

  describe "Search movie by title" do
  
    it "should return a list of movies match that title" do
   
     quizBuilder = KeywordQuiz::QuizBuilder.new()
     results = quizBuilder.searchByTitle('Brazil')
     results.length.should_not eql 0
      
   end
 
  end
end