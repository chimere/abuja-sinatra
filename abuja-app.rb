#! /usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'dm-core'
require 'dm-timestamps'

Datamapper::setup(:default, "sqlite3://#{Dir.pwd}/abuja-maps.db")

get '/foo' do
	erb :foo
end