require "./test_helper"
require "../lib/processor/input_processor"

class InputProcessorTest < Minitest::Test
 
  def setup
  end
  def test_parse_data_with_empty_values
    expected = 0
    actual = InputProcessor.parse_data("","")
    assert expected, actual
  end
end