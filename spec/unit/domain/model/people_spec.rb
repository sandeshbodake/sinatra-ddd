# frozen_string_literal: true

require 'domain/model/people'

RSpec.describe Domain::People do
  let(:persons_port) { double('Person port') }
  let(:people) { Domain::People.new(persons_port) }

  context '#all' do
    it 'returns all people through person port' do
      expected_result = [Faker::Name.name, Faker::Number.decimal]
      allow(persons_port).to receive(:all).and_return(expected_result)
      actual_result = people.all
      expect(expected_result).to eq(actual_result)
    end
  end
end
