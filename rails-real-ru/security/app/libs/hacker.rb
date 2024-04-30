# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require 'net/http'

class Hacker
  class << self
    def hack(email, password)
      # BEGIN

      # Шаг 1: Получение страницы регистрации и парсинг CSRF токена
      url = 'https://rails-collective-blog-ru.hexlet.app/users/sign_up'
      html = Nokogiri::HTML(URI.open(url))
      csrf_token = html.at('input[name="authenticity_token"]')['value']
      cookies = URI.open(url).meta['set-cookie']

      # Шаг 2: Отправка формы регистрации с учетными данными и токеном
      uri = URI.parse('https://rails-collective-blog-ru.hexlet.app/users')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)
      request['Cookie'] = cookies
      request.set_form_data('user[email]' => email, 'user[password]' => password, 'authenticity_token' => csrf_token)

      response = http.request(request)

      if response.code == '302'
        puts 'Пользователь успешно зарегистрирован!'
        return true
      else
        puts 'Ошибка при регистрации пользователя'
        return false
      end

      # END
    end
  end
end
