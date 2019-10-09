# frozen_string_literal: true

require 'presentation/controller/application_controller'
require 'presentation/controller/person_controller'

module Presentation
  module Controller
    # Controller that handles requests about Person-related actions
    class MasterSiteController < ApplicationController
      use PersonController
      def initialize(people = Domain::People.new)
        super
        @people = people
      end

      get '/' do
        erb :index
      end

      # Check this. Aside of halting requests on non existent resources,
      # It prevents assets being searched in the controller routes,
      # Avoiding: RuntimeError - downstream app not set; 500
      get '/*' do
        halt 404, 'Not found'
      end
    end
  end
end