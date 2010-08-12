require "spec"
require File.dirname(__FILE__) + '/../lib/keyword_quiz.rb'

describe "Keyword::MovieInfo" do

  describe "valid MovieInfo" do
  
    it "should be created with an ID and a description" do
     movieBrazil = createMovieInfo('0088846', 'Brazil')
     movieBrazil.movieID.should eql '0088846'
     movieBrazil.title.should eql 'Brazil'
     
     describe "adding keywords" do
       it "should add an array of keywords" do
         movieBrazil.addKeywords ['George Orwell', 'Dystopia', 'Shoe As Hat']
         movieBrazil.listKeywords.length.should eql 3
       end
     end
   end
 
   def createMovieInfo(movieID, movieTitle)
     KeywordQuiz::MovieInfo.new(movieID, movieTitle)
   end
  end
end