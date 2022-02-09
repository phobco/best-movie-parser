class Film
  attr_reader :title, :director, :year

  def self.read_from_file(file_path)
    title, director, year = File.readlines(file_path, chomp: true)

    new(
      title: title,
      director: director,
      year: year.to_i
    )
  end

  def initialize(params)
    @title = params[:title]
    @director = params[:director]
    @year = params[:year]
  end

  def to_s
    "#{@director} - #{@title} (#{@year})"
  end
end
