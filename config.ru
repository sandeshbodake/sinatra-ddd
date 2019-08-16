# frozen_string_literal: true

require_relative 'server.rb'

use Rack::Reloader unless settings.production?

instance_eval(&MAIN_ROUTES)
