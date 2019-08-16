# frozen_string_literal: true

require 'infrastructure/database/model/person'

FactoryBot.define do
  factory :person_db, class: Infrastructure::Database::Model::Person do
    name { Faker::Name.unique.name }
  end
end
