# frozen_string_literal: true

require 'rack'

class Router
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call(env)
    request = Rack::Request.new(env)
    if request.path == '/' 
      [200, {}, ['Hello, World!']]
    elsif request.path == '/about'
      [200, {}, ['About page']]
    else 
      [404, {}, ["404 Not Found"]]
    end
    # END
  end
end
