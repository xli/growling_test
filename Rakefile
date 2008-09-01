# Rakefile for Growing Test        -*- ruby -*-

# Copyright 2008 by Li Xiao (iam@li-xiao.com) & WPC(wpc@thoughtworks.com)
# All rights reserved.

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/lib')
require 'growling_test'
Test::Unit.run = true

require 'rubygems'
require 'rake/gempackagetask'

require 'rake/testtask'

desc "Default Task"
task :default => :gem

File.open(File.dirname(__FILE__) + '/growling_test.gemspec') do |f|
  spec = eval(f.read)
  package_task = Rake::GemPackageTask.new(spec) do |pkg|
    #pkg.need_zip = true
    #pkg.need_tar = true
  end
end

Rake::TestTask.new(:test) do |t|
  t.test_files = FileList['test/*test.rb']
  t.warning = true
  t.verbose = false
end
