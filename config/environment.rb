# frozen_string_literal: true

configure :development do
  enable :logging
  enable :show_exceptions
  enable :raise_errors
  disable :run
end

configure :production do
  disable :logging
  disable :show_exceptions
  disable :raise_errors
  disable :run
end

configure :test do
  enable :logging
  enable :show_exceptions
  enable :raise_errors
  disable :run
end
