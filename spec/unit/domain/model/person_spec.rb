# frozen_string_literal: true

require 'domain/model/person'

RSpec.describe Domain::Person do
  let(:name) { Faker::Name.name }
  let(:person) { described_class.new(name) }

  context '#to_hash' do
    it 'returns a hash containing the person name' do
      expected_hash = { name: name }
      actual_hash = person.to_hash
      expect(actual_hash).to eq(expected_hash)
    end

    it 'behaves exactly as to_h' do
      expect(person.to_hash).to eq(person.to_h)
    end
  end
end
