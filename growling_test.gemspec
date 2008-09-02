Gem::Specification.new do |spec|
  spec.name = 'growling_test'
  spec.version = '0.0.1'
  spec.summary = "GrowlingTest is a tool for notifying test running status by Growl."

  #### Dependencies and requirements.

  #### Which files are to be included in this gem?  Everything!  (Except SVN directories.)

  spec.files = ["lib/growling_test", "lib/growling_test/failed.png", "lib/growling_test/growl.rb", "lib/growling_test/notify.scpt.txt", "lib/growling_test/register.scpt.txt", "lib/growling_test/succeeded.png", "lib/growling_test/unit.rb", "lib/growling_test.rb", "growling_test.gemspec", "lib", "LICENSE.TXT", "Rakefile", "README", "screenshot.jpg"]

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