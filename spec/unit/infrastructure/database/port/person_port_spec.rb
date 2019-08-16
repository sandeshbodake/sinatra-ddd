# frozen_string_literal: true

require 'infrastructure/database/port/person_port'
require 'domain/model/person'

RSpec.describe Infrastructure::Database::PersonPort do
  let(:person_port) { Infrastructure::Database::PersonPort.new }

  context '#all' do
    let(:person_entity) { build(:person_db) }

    it 'returns all people as domain objects' do
      allow(Infrastructure::Database::Model::Person).to receive(:all).and_return([person_entity])
      actual_person = person_port.all[0]
      expect(actual_person.class).to be(Domain::Person)
      expect(actual_person.name).to eq(person_entity.name)
    end
  end
end
