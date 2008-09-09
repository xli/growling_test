require 'thread'
require 'singleton'

class Growl
  include Singleton
  
  FILE_DIR = File.expand_path(File.dirname(__FILE__))

  NOTIFY_SCPT = FILE_DIR + '/notify.scpt.txt'
  REGISTER_SCPT = FILE_DIR + '/register.scpt.txt'

  FINISHED_ICON = "#{FILE_DIR}/succeeded.png"
  FAILURE_ICON = "#{FILE_DIR}/failed.png"
  
  def self.available?
    system('which osascript >/dev/null 2>&1')
  end

  def initialize
    register
    @success = true
    @queue = Queue.new
    Thread.new do
      while proc = @queue.pop
        proc.call
      end
    end
  end
  
  def display_finished(title, content='')
    @queue << Proc.new do 
      with_script_compiled(NOTIFY_SCPT) do |script|
        system silent("osascript #{script} 'Test Finished' #{title.inspect} #{content.inspect} #{FINISHED_ICON.inspect}")
      end
    end
  end
  
  def display_fault(title, content='')
    @success = false
    Thread.new do
      with_script_compiled(NOTIFY_SCPT) do |script|
        system silent("osascript #{script} 'Test Fault' #{title.inspect} #{content.inspect} #{FAILURE_ICON.inspect}")
      end
    end
  end
  
  def all_finished(title, content='Oh! All Tests Finished')
    with_script_compiled(NOTIFY_SCPT) do |script|
      icon = (@success ? FINISHED_ICON : FAILURE_ICON).inspect
      system silent("osascript #{script} 'All Tests Finished' #{title.inspect} #{content.inspect} #{icon}")
    end
  end

  def register
    with_script_compiled(REGISTER_SCPT) do |script|
      system silent(%{osascript #{script}})
    end
  end
  
  def with_script_compiled(script)
    t = "/tmp/growling_test_#{script.split('/').last.split('.').first}.scpt"
    unless File.exists?(t)
      system silent("osacompile -o #{t} #{script.inspect}")
    end
    yield(t)
  end
  
  def silent(script)
    defined?(GROWLING_TEST_ENV) && GROWLING_TEST_ENV == 'test' ? script : "#{script} >/dev/null 2>&1"
  end
end