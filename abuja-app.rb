#! /usr/bin/env ruby

require 'rubygems'
require 'sinatra'

get '/foo' do
	erb :foo
end