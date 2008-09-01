require 'growling_test/growl'
unless Growl.available?
  return
end
require 'growling_test/unit'
module GrowlingTest
  VERSION="0.0.1"
end
