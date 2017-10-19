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

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "nkss-rails"
  gem.homepage = "http://github.com/nedap/nkss-rails"
  gem.license = "MIT"
  gem.summary = 'Create pretty styleguides for your Rails project.'
  gem.description = 'Nkss-rails is a drop-in, easy-to-use, gorgeous-by-default '\
    'Rails plugin you can put into your projects so you can instantly have '\
    'cute docs.'
  gem.email = %w(thijs@80beans.com)
  gem.authors = %w(Rico\ Sta.\ Cruz Nadarei,\ Inc. Steven\ Weller)
end
Jeweler::RubygemsDotOrgTasks.new

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
  rdoc.title = "nkss-rails #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'gemfury/tasks'
Gemfury.account = "nedap-healthcare"
task :release => 'fury:release'
