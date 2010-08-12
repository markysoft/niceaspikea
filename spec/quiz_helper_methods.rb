
module QuizHelperMethods  
  
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