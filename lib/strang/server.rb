# Encoding: UTF-8

require 'sinatra'
require 'json'

class Strang
  class Server < Sinatra::Base

    get '/analyze' do
      run
    end

    post '/analyze' do
      run
    end

    private

    def run
      result = Strang.new(params[:text]).analyze
      json = JSON.generate(:text => result)
      json
    end
    
  end
end