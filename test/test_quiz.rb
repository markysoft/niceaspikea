require "test/unit"
require "relative"
require_relative "../lib/keyword_quiz"

class TestQuiz < Test::Unit::TestCase
  
  #def test_start
    #quiz = Quiz.new()
    #quiz.details('0088846')
    #keywords = MovieKeywords.new()
    #puts keywords.byId('0088846').length
    #puts keywords.byId('0088846')[0]
    #puts keywords.byId('0088846')[-1]  
  #end
   
  def test_create_quiz
    aQuiz = createQuiz 'A Test Quiz'  
  end
  
  def test_add_question_to_quiz
    aQuiz = createQuiz 'A Test Quiz'
    questionOne = createQuestion
    aQuiz.addQuestion questionOne
    assert_equal(1, aQuiz.questions.length)
  end  
  
  def test_add_choices_to_a_question 
    questionOne = createQuestion
    movieBrazil = createMovieInfo('0088846', 'Brazil')
    questionOne.addMovie movieBrazil
    movieV = createMovieInfo('0434409', 'V for Vendetta')
    questionOne.addMovie movieV 
    assert_equal(2, questionOne.listChoices.length)
  end
  
  def test_add_keywords_to_movie_info
    movieBrazil = createMovieInfo('0088846', 'Brazil')
    movieBrazil.addKeywords ['George Orwell', 'Dystopia', 'Shoe As Hat']
    assert_equal(3, movieBrazil.listKeywords.length)
  end  
  
  def test_set_question_answer_by_index_or_movie
    questionOne = createQuestion
    movieBrazil = createMovieInfo('0088846', 'Brazil')
    movieBrazil.addKeywords ['George Orwell', 'Dystopia', 'Shoe As Hat']
    questionOne.addMovie movieBrazil
    movieV = createMovieInfo('0434409', 'V for Vendetta')
    movieV.addKeywords ['Shave and a Haircut', 'Dystopia', 'Butterfly Collection', 'Egg']
    questionOne.addMovie movieV 
    questionOne.keyword = 'Shoe As Hat'
    questionOne.answer = 0
    assert_equal(questionOne.listChoices[questionOne.answer], movieBrazil)
    questionOne.answer = movieV
    assert_equal(questionOne.listChoices[questionOne.answer], movieV)
  end   
  
  def test_set_question_answer_by_keyword
    questionOne = createQuestion
    movieBrazil = createMovieInfo('0088846', 'Brazil')
    movieBrazil.addKeywords ['George Orwell', 'Dystopia', 'Shoe As Hat']
    questionOne.addMovie movieBrazil
    movieV = createMovieInfo('0434409', 'V for Vendetta')
    movieV.addKeywords ['Shave and a Haircut', 'Dystopia', 'Butterfly Collection', 'Egg']
    questionOne.addMovie movieV 
    questionOne.setAnswerByKeyword('Butterfly Collection');
    assert_equal(questionOne.listChoices[questionOne.answer], movieV)
    questionOne.setAnswerByKeyword('George Orwell');
    assert_equal(questionOne.listChoices[questionOne.answer], movieBrazil)
  end    
  
  def test_get_unique_keywords
    question = createQuestionWithMoviesAndKeywords
    uniqueKeywords = question.getUniqueKeywords
    assert_equal(5, uniqueKeywords.length)
  end  
  
  def createQuiz (quizTitle)
    KeywordQuiz::Quiz.new(quizTitle)
  end
  
  def createQuestion
    KeywordQuiz::Question.new()
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


