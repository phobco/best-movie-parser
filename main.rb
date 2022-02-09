require 'nokogiri'
require 'open-uri'

require_relative 'lib/film_collection'
require_relative 'lib/films_site_parser'
require_relative 'lib/film'

puts 'Программа "Фильм на вечер"'
puts 'Загружаю данные из сети...'

films = FilmsSiteParser.get_films_from_mail_ru

collection = FilmCollection.new(films)

collection.directors.each.with_index(1) { |director, i| puts "#{i}. #{director}" }

puts
puts 'Фильм какого режиссера вы хотите сегодня посмотреть?'
selected_director = collection.directors[gets.to_i - 1]
puts

puts 'И сегодня вечером рекомендую посмотреть:'
puts collection.film_by_director(selected_director)
