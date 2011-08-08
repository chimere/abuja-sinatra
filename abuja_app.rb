#! /usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'datamapper'
#require 'dm-core'
#require 'dm-timestamps'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/abuja_maps.db")

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
  @title = "Abuja Maps: ********"
end

get '/list' do
  erb :list
end

get '/map' do
  @title = "Abuja Maps: Find the nearest facilities around!"
  erb :map
end

post '/pdf' do
  @title = "Create a location Pdf"
end

get '/pdf/:id' do
end

post '/property' do
  @title = "Create a new location"
end

put '/property/:id' do
end

delete '/property/:id' do
end


get '/foo' do
	erb :foo
end