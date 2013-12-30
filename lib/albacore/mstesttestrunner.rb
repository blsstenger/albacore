require "albacore/albacoretask"
require "albacore/config/mstesttestrunnerconfig"

class MSTestTestRunner
  TaskName = :mstest
  
  include Albacore::Task
  include Albacore::RunCommand
  
  attr_reader :no_logo
  
  attr_array  :assemblies, 
              :tests
  
  def initialize()
    super()
    update_attributes(Albacore.configuration.mstest.to_hash)
  end
  
  def execute()
    result = run_command("MSTest", build_parameters)
    fail_with_message("MSTest failed, see the build log for more details.") unless result
  end  
    
  def build_parameters
    p = []
    p << @assemblies.map { |asm| "/testcontainer:\"#{asm}\"" } if @assemblies
    p << @tests.map { |test| "/test:#{test}"} if @tests
    p << "/nologo" if @no_logo
    p
  end
  
  def build_command_line
    c = []
    c << @command
    c << build_parameters
    c << @parameters
    c
  end

  def no_logo
    @no_logo = true
  end
end
