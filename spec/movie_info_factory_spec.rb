require "spec"
require File.dirname(__FILE__) + '/../lib/keyword_quiz.rb'

describe "KeywordQuiz::MovieInfoBuilder" do

  describe "create MovieInfo from ID" do
    it "should populate title, ID and keywords" do
      factory = KeywordQuiz::MovieInfoFactory.new()
      movieBrazil = factory.getMovieInfo('0088846')
      movieBrazil.movieID.should eql '0088846'
      movieBrazil.title.should eql 'Brazil'
      movieBrazil.listKeywords.length.should_not eql 0
      #puts movieBrazil.listKeywords
    end
  end
end