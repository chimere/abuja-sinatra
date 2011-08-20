#! /usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'haml'
require 'sqlite3'
require 'datamapper'
require 'dm-core'
require 'dm-timestamps'

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
  property :description,    Text, :required => true
  property :address_number, Integer
  property :street,         String
  property :area,           String
  property :longitude,      Float
  property :latitude,       Float
  
end

#Auto create and upgrade tablesls
# DataMapper.auto.upgrade!
Map.auto_upgrade!

# set utf-8 for outgoing
before do
  headers "Content-Type" => "text/html; charset=utf-8"
end

#routes
get '/' do
  @header = "Abuja Maps: Prime locations in a snap!"
  erb :welcome
end

get '/property' do
  @header = "Abuja Maps: Available reality in the city of rocks!"
  erb :welcome
end

get '/property/:id' do
  @header = "Abuja Maps: found a new heaven"
  @map = Map.get(params[:id])
  if @map
    erb :property
  else
    redirect('/list')
  end
end

get '/list' do
  @header = "Abuja Maps: Property Listings"
  @maps = Map.all
  #@maps = Map.all(:order => [:created_at.desc])
  erb :list
end

get '/map' do
  @header = "Abuja Maps: Find the nearest facilities around!"
  erb :map
end

get '/mapform' do
  @header = "Craete a new property"
  erb :mapform
end

post '/create' do
  @header = "Create a new location"
  @map = Map.new(params[:map])
  if @map.save
    redirect "/property/#{@map.id}"
  else
    redirect('list')
  end
end

post '/pdf' do
  @header = "Create a location Pdf"
end

get '/pdf/:id' do
end

post '/property' do
  @header = "Create a new location"
  params.inspect
end

put '/property/:id' do
end

# delete '/property/:id' do
# end

# get '/foo' do
#   erb :foo
# end