# frozen_string_literal: true

module Domain
  # Domain object in charge of every real-world operation concerning a Person
  class Person
    attr_reader :name

    def initialize(name = nil)
      @name = name
    end

    def to_hash
      { name: name }
    end

    alias to_h to_hash
  end
end
