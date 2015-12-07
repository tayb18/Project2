#require 'pry'
require 'sinatra'
require 'redcarpet'

require_relative 'server'
require_relative 'db/db_config'

run App::Server