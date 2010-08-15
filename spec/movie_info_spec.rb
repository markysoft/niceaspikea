require "spec"
require File.dirname(__FILE__) + '/../lib/keyword_quiz.rb'

describe "KeywordQuiz::MovieInfo" do

  describe "create new MovieInfo" do
  
    it "should be created with an ID, a description, and no keywords" do
   
     movieBrazil = KeywordQuiz::MovieInfo.new('0088846', 'Brazil')
     movieBrazil.movieID.should eql '0088846'
     movieBrazil.title.should eql 'Brazil'
     movieBrazil.listKeywords.length.should eql 0
     
     describe "adding an array of three keywords" do
       it "should now have three keywords in movieInfo" do
         movieBrazil.addKeywords ['George Orwell', 'Dystopia', 'Shoe As Hat']
         movieBrazil.listKeywords.length.should eql 3
       end
     end
     
   end
 
  end
end