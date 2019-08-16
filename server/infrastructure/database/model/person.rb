# frozen_string_literal: true

require 'active_record'
require_relative 'entity'

module Infrastructure
  module Database
    module Model
      # Database entity model for 'Person' table
      class Person < Entity
      end
    end
  end
end
