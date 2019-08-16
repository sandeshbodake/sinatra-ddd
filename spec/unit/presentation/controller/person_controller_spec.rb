# frozen_string_literal: true

require 'presentation/controller/person_controller'
require 'rack/test'

RSpec.describe Presentation::Controller::PersonController do
  include Rack::Test::Methods

  def app
    Presentation::Controller::PersonController
  end

  context 'GET persons' do
    context 'valid request' do
      let(:person1) { build(:person) }
      let(:person2) { build(:person) }

      it 'returns json array of persons' do
        allow_any_instance_of(Domain::People).to receive(:all).and_return([person1, person2])

        get '/'

        expect(last_response).to be_ok
        expect(last_response.body).to eq("[{\"name\":\"#{person1.name}\"},{\"name\":\"#{person2.name}\"}]")
      end
    end
  end
end
