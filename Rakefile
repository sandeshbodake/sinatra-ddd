# frozen_string_literal: true

load 'database.rake'

task default: %w[rundev]

task :run do
  rackup
end

task :rundev do
  bundle exec 'foreman start'
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
