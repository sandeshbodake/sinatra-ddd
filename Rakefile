# frozen_string_literal: true

require 'dotenv/load'
load 'config/db/database.rake'

ENV['APP_ENV'] = ENV['RACK_ENV']

task default: %w[run]

task :run do
  case ENV['RACK_ENV']
  when 'development'
    Rake::Task['rundev'].invoke
  when 'test'
    Rake::Task['test'].invoke
  when 'production'
    Rake::Task['runsys'].invoke
  end
end

task :runsys do
  sh "cd ./server/presentation/view && \
      ./node_modules/.bin/webpack --config webpack.config.js --mode #{ENV['APP_ENV']} && \
      cd -"
  bundle exec 'puma'
end

task :rundev do
  bundle exec 'foreman start'
end

task :test do
  ENV['RACK_ENV'] = ENV['APP_ENV'] = 'test'
  sh 'bundle exec rspec'
  bundle exec 'cucumber'
end

task :routes do
  root = File.expand_path(File.join(__dir__, '.'))
  $LOAD_PATH.unshift File.join(root, 'server')

  require_relative 'config/routes'

  @routes = {}

  def map(relative_path)
    @current_map = relative_path
    yield
  end

  def run(klass)
    sub_routes = klass.new.settings.routes.map do |method, paths|
      [method, paths.map { |path| "#{@current_map.chomp('/')}#{path[0]}" }]
    end.to_h
    @routes[@current_map] = { klass.to_s => sub_routes }
  end

  MAIN_ROUTES.call(root)

  print_pretty @routes
end

def print_pretty(routes_hash)
  routes_hash.each do |main, sub|
    print main + '  =>  '
    sub.each do |controller, methods|
      puts controller
      methods.each do |method, occurences|
        puts "\t\t" + method
        occurences.each { |route| puts "\t\t\t\t" + route }
      end
    end
  end
end
