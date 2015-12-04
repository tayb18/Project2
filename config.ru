require 'pry'
require 'sinatra'

require_relative 'server'
require_relative 'db/db_config'
run App::Server