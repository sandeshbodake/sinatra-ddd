# frozen_string_literal: true

require 'dotenv/load'

ENV['RACK_ENV'] = ENV['APP_ENV'] = ENV['SYS_ENV']

root = File.expand_path(File.join(__dir__, '.'))
$LOAD_PATH.unshift File.join(root, 'server')

require 'sinatra'
require_relative 'config/environment'

# get main routes defined in server/config/routes.rb
require_relative 'config/routes'
require 'util/loggable'
