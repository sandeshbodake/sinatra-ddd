# frozen_string_literal: true

configure :development, :production do
  set :public_folder, settings.root + '/server/presentation/view/build'
  set :views, settings.root + '/server/presentation/view'
end

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
  set :views, settings.root + '/int/view'
end
