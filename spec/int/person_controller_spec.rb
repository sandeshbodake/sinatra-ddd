# frozen_string_literal: true

require 'presentation/controller/person_controller'
require 'rack/test'

RSpec.describe Presentation::Controller::PersonController do
  include Rack::Test::Methods

  def app
    Presentation::Controller::PersonController
  end

  let!(:person1) { create(:person_db) }
  let!(:person2) { create(:person_db) }

  context 'GET persons' do
    context 'valid request' do
      it 'returns a json array of persons' do
        get '/'

        expect(last_response).to be_ok
        expect(last_response.body).to eq("[{\"name\":\"#{person1.name}\"},{\"name\":\"#{person2.name}\"}]")
      end
    end
  end
end
