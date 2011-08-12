#! /usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'datamapper'
#require 'dm-core'
#require 'dm-timestamps'

DataMapper::setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/abuja_maps.db")

#DataMapper::Database.setup({   
#  :adapter  => 'sqlite3',
#  :host     => 'localhost',
#  :username => '',
#  :password => '',
#  :database => 'db/abujamaps'
#})

class Map
  
  include DataMapper::Resource
  
  property :id,             Serial
  property :title,          String
  property :description,    Text
  property :address_number, Integer
  property :street,         String
  property :area,           String
  property :longitude,      Integer
  property :latitude,       Integer
  
end

#Auto create and upgrade tablesls
# DataMapper.auto.upgrade!
Map.auto_upgrade!

#set utf-8 for outgoing
before do
  headers "Content-Type" => "text/html; charset=utf-8"
end

#routes
get '/' do
  @title = "Abuja Maps: Prime locations in a snap!"
  erb :welcome
end

get '/property' do
  @title = "Abuja Maps: Available reality in the city of rocks!"
  erb :welcome
end

get '/property/:id' do
  @title = "Abuja Maps: found a new heaven"
  erb :property
end

get '/list' do
  erb :list
end

get '/map' do
  @title = "Abuja Maps: Find the nearest facilities around!"
  erb :map
end

get '/mapform' do
  @title = "Craete a new property"
  erb :mapform
end

post '/create' do
  @title = "Create a new location"
  @map = Map.new(params[:map])
  if @map.save
    redirect "/property/#{@map.id}"
  else
    redirect('list')
  end
end

post '/pdf' do
  @title = "Create a location Pdf"
end

get '/pdf/:id' do
end

post '/property' do
  @title = "Create a new location"
  params.inspect
end

put '/property/:id' do
end

delete '/property/:id' do
end

get '/foo' do
	erb :foo
end