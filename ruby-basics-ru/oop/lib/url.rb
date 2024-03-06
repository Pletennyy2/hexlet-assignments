# frozen_string_literal: true

# BEGIN
require 'uri'
require 'cgi'

class Url
  attr_accessor :url

  include Comparable
  def <=>(other)
    url.chars.sort <=> other.url.chars.sort
  end

  def initialize(url)
    @url = url
  end

  def query_params()
    i = url.scan(/[^?]+/)
    if i[1] != nil
      array = CGI::parse(i[1])
      Hash[array.map{ |k, v| [k.to_sym, v.join()] }]
    else
      {}
    end
  end
  
  def query_param(key, default = nil)
    hash = self.query_params
    hash.fetch(key, default)
  end

  def scheme()
    URI(url).scheme
  end

  def host()
    URI(url).host
  end

  def port()
    URI(url).port
  end

end
# END
