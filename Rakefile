# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'
require 'juwelier'
Juwelier::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = 'cookbook'
  gem.homepage = 'https://gemvein.com/museum/cases/cookbook'
  gem.metadata = { source_code_uri: 'http://github.com/gemvein/cookbook' }
  gem.license = 'MIT'
  gem.summary = %(Mountable Engine to show instructions with components, like a cookbook or instruction manual)
  gem.description = 'Cookbook allows you to associate instructions with components in a cross referenced way. '\
                    'Good for cooking recipes or an instruction manual for DIY projects.'
  gem.email = 'loren.lundgren@gmail.com'
  gem.authors = ['Loren Lundgren']

  # dependencies defined in Gemfile
end
Juwelier::RubygemsDotOrgTasks.new
require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

desc "Code coverage detail"
task :simplecov do
  ENV['COVERAGE'] = "true"
  Rake::Task['test'].execute
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "cookbook #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
