require 'test/unit'
$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/../lib')
require 'growling_test'
class ManualTest < Test::Unit::TestCase
  100.times do |index|
    define_method("test_index_#{index}".to_sym) {sleep(0.1)}
  end

  1.times do |index|
    define_method("test_error_index_#{index}".to_sym) { raise 'Error' }
  end

  1.times do |index|
    define_method("test_failure_index_#{index}".to_sym) { assert_equal 1, 2 }
  end
end