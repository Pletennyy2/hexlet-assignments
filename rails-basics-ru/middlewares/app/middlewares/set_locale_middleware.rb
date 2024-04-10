# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    accept_language = env['HTTP_ACCEPT_LANGUAGE']
    if accept_language && !accept_language.empty?
      locale = accept_language.scan(/[a-z]{2}/).first
      if locale
        locale = locale.to_sym if I18n.available_locales.include?(locale.to_sym)
      else
        locale = I18n.default_locale
      end
      I18n.locale = locale
    end

    @app.call(env)
  end
end
