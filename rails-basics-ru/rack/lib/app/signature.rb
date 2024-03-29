# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call(env)
    request = Rack::Request.new(env)
    crypted_body = Digest::SHA2.new(256).hexdigest(body.join)
    if status == 200
      [status, headers, [body.join + crypted_body]]
    else
      [status, headers, body]
    end
    # END
  end
end
