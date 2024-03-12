# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call(env)
    request = Rack::Request.new(env)
    if request.path.start_with?('/admin') #start_with? - это метод, который проверяет, начинается ли строка с указанного префикса. В данном случае, 
      #if request.path.start_with?('/admin') означает, что мы проверяем, начинается ли путь запроса со строки '/admin'.
      [403, {}, []]
    else
      [status, headers, body]
    end
    # END
  end
end
