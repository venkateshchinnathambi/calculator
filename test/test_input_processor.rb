require "./test_helper"

class InputProcessorTest < Minitest::Test
 
  def setup
  end

  def test_parse_data_with_valid_values_comma_seperated
    expected = [2,4]
    input = "2,4"
    delimeter = [","]
    actual = InputProcessor.parse_data(input,delimeter)    
    assert_equal expected, actual
  end

  def test_parse_data_with_valid_value_comman_and_newline
    expected = [2,4,5]
    input = "2,4\n5"
    delimeter = [",","\n"]
    delimeter = delimeter.each{|d| Regexp.escape(d)}
    actual = InputProcessor.parse_data(input,delimeter)    
    assert_equal expected, actual
  end

  def test_parse_data_with_empty_values
    expected = 0
    actual = InputProcessor.parse_data("","")
    assert_equal expected, actual
  end
  
end