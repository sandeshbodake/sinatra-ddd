# frozen_string_literal: true

require 'sinatra'
require_relative 'config/environment.rb'

# get main routes defined in config/routes.rb
require_relative 'config/routes'

use Rack::Reloader unless settings.production?

instance_eval(&MAIN_ROUTES)
