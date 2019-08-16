# frozen_string_literal: true

require 'infrastructure/database/model/person.rb'
require 'domain/model/person.rb'

module Infrastructure
  module Database
    # Port to perform operations on the data source
    class PersonPort
      def all
        Model::Person.all.map do |person_entity|
          parse_person(person_entity)
        end
      end

      private

      def parse_person(person_entity)
        Domain::Person.new(person_entity.name)
      end
    end
  end
end
