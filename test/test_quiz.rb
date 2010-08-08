require "test/unit"

require "relative"
require_relative "../lib/keyword_quiz"
#require_relative "../lib/keyword_quiz/quiz"
#require_relative "../lib/keyword_quiz/question"
#require_relative "../lib/keyword_quiz/moviekeywords"
#require_relative "../lib/keyword_quiz/movie_info"
class QuizTest < Test::Unit::TestCase
  
  #def test_start
    #quiz = Quiz.new()
    #quiz.details('0088846')
    #keywords = MovieKeywords.new()
    #puts keywords.byId('0088846').length
    #puts keywords.byId('0088846')[0]
    #puts keywords.byId('0088846')[-1]
    
  #end
  
  def test_create_quiz
    aQuiz = KeywordQuiz::Quiz.new('A Test Quiz')
    
    questionOne = KeywordQuiz::Question.new()
    movieBrazil = KeywordQuiz::MovieInfo.new('0088846', 'Brazil')
    movieBrazil.keywords << ['George Orwell', 'Dystopia', 'Shoe As Hat']
    questionOne.choices << movieBrazil

    movieV = KeywordQuiz::MovieInfo.new('0434409', 'V for Vendetta')
    movieV.keywords << ['Shave and a Haircut', 'Butterfly Collection', 'Egg']
    questionOne.choices << movieV 
    
    questionOne.keyword = 'Shoe As Hat'
    questionOne.answer = 0

    aQuiz.questions << questionOne
    
    assert_equal(questionOne.choices[questionOne.answer], movieBrazil)
    
    questionOne.answer = movieV
    assert_equal(questionOne.choices[questionOne.answer], movieV)
   
  end
end