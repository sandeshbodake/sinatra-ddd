# frozen_string_literal: true

require 'presentation/controller/person_controller'
require 'presentation/controller/application_controller'

# map main routes to CONTROLLERS
# (not single routes, those are defined in each controller)
MAIN_ROUTES = lambda { |_|
  [
    # GET /persons/<>, # POST /persons/<>, # DELETE /persons/<>.
    # See PersonController for detailed routes
    { path: '/persons/', handler: Presentation::Controller::PersonController },
    # GET / -> Default route
    { path: '/', handler: Presentation::Controller::ApplicationController }
  ].each { |route| map(route[:path]) { run route[:handler] } }
}
