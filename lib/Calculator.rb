# frozen_string_literal: true

require_relative "Calculator/version"
require_relative "./processor/input_processor"


module Calculator  
  class Error < StandardError; end 
  input = ""
  while input.upcase != "E"
    InputProcessor.process_input(input) unless input.empty?
    puts "Enter Input (E/e to Exit):"
    input = gets().chomp;
  end
end
