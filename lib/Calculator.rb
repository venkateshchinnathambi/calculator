# frozen_string_literal: true

require_relative "Calculator/version"


module Calculator
  include InputProcessor
  class Error < StandardError; end 
end
