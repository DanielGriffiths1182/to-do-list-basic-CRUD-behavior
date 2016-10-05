require 'sinatra'


def display_hello(person)
  "hi #{person}"
end

get '/' do
  'Hello, buttholes'
end

get '/hello/:first_name/' do
  p params
  display_hello(params['name'])
end

get '/hello' do
  p params
  display_hello(params['name'])
end
