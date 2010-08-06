require 'rubygems'
require 'imdb'

class QuizBuilder
  def search(movieName)
    results = Imdb::Search.new(movieName)
    puts results.movies[0..5].collect{ |m| [m.id, m.title].join(" - ") }.join("\n")
  end

  def details(id)
    movie = Imdb::Movie.new(id)
    puts [movie.title, movie.year].join(", ") 
  end

end