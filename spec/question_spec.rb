require "spec"
require File.dirname(__FILE__) + '/../lib/keyword_quiz.rb'

describe "Keyword::Question" do

  describe "creating a new question" do
    it "should create a question with no answer and no choices" do
    
      question = KeywordQuiz::Question.new()
      question.answer.should eql nil
      question.listChoices.length.should eql 0
      
      describe "adding two choices to a question" do   
         it "should now have two choices" do 
         
           movieBrazil = KeywordQuiz::MovieInfo.new('0088846', 'Brazil')
           question.addMovie movieBrazil
           movieV = KeywordQuiz::MovieInfo.new('0434409', 'V for Vendetta')
           question.addMovie movieV 
           question.listChoices.length.should eql 2
           
           describe "setting answer by keyword" do
             it "should set the answer to the choice with that keyword" do
           
                movieBrazil.addKeywords ['George Orwell', 'Dystopia', 'Shoe As Hat']
                movieV.addKeywords ['Shave and a Haircut', 'Dystopia', 'Butterfly Collection', 'Egg']
                question.setAnswerByKeyword('Butterfly Collection')
                question.answerAsMovie.should eql movieV
                
                describe "change answer by keyword" do
                  it "should set the answer to the new movie" do
                    question.setAnswerByKeyword('George Orwell')
                    question.answerAsMovie.should eql movieBrazil
                  end
                end
                
             end
             
           end #end setting answer by keyword desc         
       
         end #end should have two choices it
                  
      end # end adding two choices desc
       
    end # end it no answer, no choices
    
  end   # end creating a question desc
  
  describe "list unique keywords" do
    it "should return 5 keywords for a total of 7 with one duplicate" do

      question = KeywordQuiz::Question.new()
      movieBrazil = KeywordQuiz::MovieInfo.new('0088846', 'Brazil')
      movieBrazil.addKeywords ['George Orwell', 'Dystopia', 'Shoe As Hat']
      question.addMovie movieBrazil
      movieV = KeywordQuiz::MovieInfo.new('0434409', 'V for Vendetta')
      movieV.addKeywords ['Shave and a Haircut', 'Dystopia', 'Butterfly Collection', 'Egg']
      question.addMovie movieV 
      uniqueKeywords = question.getUniqueKeywords
      uniqueKeywords.length.should eql 5
      
    end  
    
  end
      
end # end question desc
