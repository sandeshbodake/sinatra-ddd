# frozen_string_literal: true

require 'domain/model/person'
require 'infrastructure/database/port/person_port'

module Domain
  # Collection to perform operations over multiple Person domain objects
  class People
    def initialize(person_port = Infrastructure::Database::PersonPort.new)
      @person_port = person_port
    end

    def all
      @person_port.all
    end
  end
end
