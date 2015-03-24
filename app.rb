require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require './models/count.rb'

set :bind, '192.168.33.10'
set :port, 3000

before do
  if Count.all.size == 0
    Count.create(number: 0)
  end
end

get '/' do
    'こんにちは'
    end

get '/count' do
    @number = Count.first.number
    erb :index
    end

post '/plus1000' do
    count = Count.first
    count.number += 1000
    count.save
    redirect '/count'
    end

post '/plus100' do
    count = Count.first
    count.number += 100
    count.save
    redirect '/count'
    end

post '/plus10' do
    count = Count.first
    count.number += 10
    count.save
    redirect '/count'
    end

post '/plus' do
    count = Count.first
    count.number += 1
    count.save
    redirect '/count'
    end

post '/minus' do
    count = Count.first
    count.number -=1
    count.save
    redirect '/count'
    end

post '/minus10' do
    count = Count.first
    count.number -=10
    count.save
    redirect '/count'
    end

post '/minus100' do
    count = Count.first
    count.number -=100
    count.save
    redirect '/count'
    end

post '/minus1000' do
    count = Count.first
    count.number -=1000
    count.save
    redirect '/count'
    end

post '/clear' do
    count = Count.first
    count.number *= 0
    count.save
    redirect '/count'
    end