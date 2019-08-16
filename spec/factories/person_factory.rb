# frozen_string_literal: true

require 'domain/model/person'

FactoryBot.define do
  factory :person, class: Domain::Person do
    initialize_with { new(Faker::Name.unique.name) }
  end
end
