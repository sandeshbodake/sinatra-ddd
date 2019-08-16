# frozen_string_literal: true

require 'presentation/controller/application_controller'
require 'rack/test'

RSpec.describe Presentation::Controller::ApplicationController do
  include Rack::Test::Methods

  def app
    Presentation::Controller::ApplicationController
  end

  context 'GET index' do
    context 'valid request' do
      it 'returns a smile' do
        get '/'

        expect(last_response).to be_ok
        expect(last_response.body).to eq('{"control":":)"}')
      end
    end
  end
end
