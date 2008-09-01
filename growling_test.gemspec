$:.unshift('lib')
require 'rubygems'
require 'rake'
require 'growling_test'

Gem::Specification.new do |spec|
  spec.name = 'growling_test'
  spec.version = GrowlingTest::VERSION
  spec.summary = "GrowlingTest is a tool for notifying test running status by Growl."

  #### Dependencies and requirements.

  #### Which files are to be included in this gem?  Everything!  (Except SVN directories.)

  spec.files = FileList['lib/**/*.rb', '[a-zA-Z]*'].to_a

  #### Load-time details: library and application (you will need one or both).

  spec.require_path = 'lib'                         # Use these for libraries.

  #### Documentation and testing.

  spec.has_rdoc = false

  #### Author and project details.

  spec.author = "Li Xiao & WPC"
  spec.email = "iam@li-xiao.com"
  spec.homepage = "http://github.com/xli/growling_test/tree/master"
  spec.platform = Gem::Platform::RUBY
end