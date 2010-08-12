require "spec"
require File.dirname(__FILE__) + '/../lib/keyword_quiz.rb'

describe "Keyword::Quiz" do

  describe "valid quiz" do
  
    it "should create with a question with a description" do
  
      aQuiz =  createQuiz 'a title'
      
      describe "adding a question" do      
        it "should add a question" do       
          questionOne = createQuestion
          aQuiz.addQuestion questionOne
          aQuiz.questions.length.should eql 1
          
          describe "adding choices to a question" do

            it "should add choices to a question" do 
              movieBrazil = createMovieInfo('0088846', 'Brazil')
              questionOne.addMovie movieBrazil
              movieV = createMovieInfo('0434409', 'V for Vendetta')
              questionOne.addMovie movieV 
              questionOne.listChoices.length.should eql 2
            end
          
            def createMovieInfo(movieID, movieTitle)
              KeywordQuiz::MovieInfo.new(movieID, movieTitle)
            end
            
          end
        end
              
        def createQuestion
          KeywordQuiz::Question.new()
        end
        
      end
        
    end
    
    
  end
  
  def createQuiz (quizTitle)
    KeywordQuiz::Quiz.new(quizTitle)
  end
  
  
  def createMovieInfo(movieID, movieTitle)
    KeywordQuiz::MovieInfo.new(movieID, movieTitle)
  end
  
  def createQuestionWithMoviesAndKeywords

    questionOne = createQuestion
    movieBrazil = createMovieInfo('0088846', 'Brazil')
    movieBrazil.addKeywords ['George Orwell', 'Dystopia', 'Shoe As Hat']
    questionOne.addMovie movieBrazil
    movieV = createMovieInfo('0434409', 'V for Vendetta')
    movieV.addKeywords ['Shave and a Haircut', 'Dystopia', 'Butterfly Collection', 'Egg']
    questionOne.addMovie movieV 
    return questionOne  
  end
end

    