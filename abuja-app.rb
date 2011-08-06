#! /usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'datamapper'
require 'dm-core'
require 'dm-timestamps'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/abuja-maps.db")


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
DataMapper.auto_upgrade!

#set utf-8 for outgoing
before do
  headers "Content-Type" => "text/html; charset=utf-8"
end

#routes
get '/' do
end

get '/property' do
  @title = "Abuja Maps: Prime Locations in a snap!"
  erb :welcome
end

get '/list' do
  erb :list
end

get '/map' do
  erb :map
end

post '/pdf' do
  @title = "Create a location Pdf"
end

post '/create' do
  @title = "Create a new location"
end

get '/delete/:id' do
end

get '/show/:id' do
end







get '/foo' do
	erb :foo
end