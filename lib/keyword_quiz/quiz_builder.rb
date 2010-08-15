module KeywordQuiz

  class QuizBuilder
    def searchByTitle(movieName)
      results = Imdb::Search.new(movieName)
      results.movies
      #puts results.movies[0..5].collect{ |m| [m.id, m.title].join(" - ") }.join("\n")
    end
  
    def getFullMovieDetails(id)
      movie = Imdb::Movie.new(id)
      #puts [movie.title, movie.year].join(", ") 
    end
  
  end
  
end