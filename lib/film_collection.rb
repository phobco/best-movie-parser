class FilmCollection
  attr_reader :films

  def initialize(films)
    @films = films
  end

  def directors
    @films.map(&:director).uniq
  end

  def film_by_director(selected_director)
    @films.select { |film| selected_director == film.director }.sample
  end
end
