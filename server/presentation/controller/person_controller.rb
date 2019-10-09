# frozen_string_literal: true

require 'presentation/controller/application_controller'
require 'domain/model/people'

module Presentation
  module Controller
    # Controller that handles requests about Person-related actions
    class PersonController < ApplicationController
      def initialize(app, people = Domain::People.new)
        super app
        @people = people
      end

      get '/persons' do
        json @people.all.map(&:to_hash)
      end
    end
  end
end
