module FilmsSiteParser
  module_function

  BASE_URL =
    {
      mail_ru: 'https://kino.mail.ru'
    }

  def get_films_from_mail_ru
    get_url_from_mail_ru.sample(10).map do |url|
      html = URI.open(url, &:read)
      doc = Nokogiri::HTML(html)

      Film.new(
        title: doc.css('h1.text').text,
        director: doc.css('div.table__cell a').first.text,
        year: doc.css('.text .nowrap').first.text.to_i
      )
    end
  end

  private

  def self.get_url_from_mail_ru
    url = "#{BASE_URL[:mail_ru]}/cinema/top/"
    html = URI.open(url, &:read)

    doc = Nokogiri::HTML(html)

    doc.css('.text .link').
      map { |node| "#{BASE_URL[:mail_ru]}#{node['href']}" }
  end
end
