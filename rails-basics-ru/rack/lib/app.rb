# frozen_string_literal: true

require 'rack'
require_relative 'app/admin_policy'
require_relative 'app/execution_timer'
require_relative 'app/signature'
require_relative 'app/router'

module App
  def self.init
    Rack::Builder.new do |builder| #создает новый экземпляр класса 
      #Rack::Builder, позволяя конфигурировать middleware и приложение.
      builder.use AdminPolicy

      builder.use Signature

      builder.run Router.new
    end
  end
end
