require 'bundler'
Bundler::GemHelper.install_tasks

task :default => :test

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.pattern = "test/*_test.rb" 
end

begin
  require 'rocco/tasks'
  require 'rake/clean'
  Rocco::make 'docs/'

  desc 'Build rocco docs'
  task :docs => :rocco
  directory 'docs/'

  desc 'Build docs and open in browser for the reading'
  task :read => :docs do
    sh 'open docs/index.html'
  end

  file 'docs/index.html' => 'lib/require_relative.rb' do |f|
    cp "docs/lib/require_relative.html", "docs/index.html"
    cp "docs/lib/require_relative.html", "docs/require_relative.html"
  end

  file 'docs/require_relative/version.html' => 'lib/require_relative/version.rb' do |f|
    mkdir "docs/require_relative"
    cp "docs/lib/require_relative/version.html", "docs/require_relative/version.html"
  end

  task :docs => 'docs/index.html'
  task :docs => 'docs/require_relative/version.html'
  CLEAN.include 'docs/index.html'

  # Alias for docs task
  task :doc => :docs

rescue LoadError
  warn "#$! -- rocco tasks not loaded."
end

