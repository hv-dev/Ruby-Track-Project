require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require 'net/http'
require '../lib/run.rb'
require '../lib/models/MainMenu.rb'
require 'poke-api-v2'