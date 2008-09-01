require 'test/unit/ui/console/testrunner'

module GrowlingTest
  module TestRunner
    def self.included(base)
      base.class_eval do
        alias_method :attach_to_mediator_without_growl, :attach_to_mediator
        alias_method :attach_to_mediator, :attach_to_mediator_with_growl
      end
    end
    
    def attach_to_mediator_with_growl
      @mediator.add_listener(Test::Unit::TestResult::FAULT, &method(:display_fault_with_growl))
      @mediator.add_listener(Test::Unit::TestCase::FINISHED, &method(:display_finished_with_growl))
      @mediator.add_listener(Test::Unit::UI::TestRunnerMediator::FINISHED, &method(:all_finished_with_growl))
      attach_to_mediator_without_growl
    end
    
    def display_finished_with_growl(name)
      method_name, class_name = names(name)
      Growl.instance.display_finished(class_name, method_name)
    rescue Exception => e
    end
    
    def display_fault_with_growl(fault)
      method_name, class_name = names(fault.test_name)
      Growl.instance.display_failure("#{fault.class.name.split("::").last}: #{class_name}", method_name)
    rescue Exception => e
    end
    
    def all_finished_with_growl(elapsed_time)
      Growl.instance.all_finished("Finished in #{elapsed_time} seconds.")
    rescue Exception => e
    end
    
    def names(test_name)
      test_name =~ /([^\(]*)\(([^\)]*)\)/
      [$1, $2]
    end
  end
end

Test::Unit::UI::Console::TestRunner.send(:include, GrowlingTest::TestRunner)
