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
    expected = []
    delimeters = [",","\n"]
    delimeters = delimeters.each{|d| Regexp.escape(d)}
    actual = InputProcessor.parse_data("",delimeters)
    assert_equal expected, actual
  end

  def test_process_input_with_empty
    input = ""
    expected = 0
    actual = InputProcessor.process_input(input)
    assert_equal expected, actual
  end

  def test_validate_digits_with_negatives
    data = [1,-2,-5]  
    expected = "negatives not allowed [-2, -5]"  
    errors = assert_raises(StandardError)do
      InputProcessor.validate_data(data)
    end
    assert_equal expected,errors.message
  end

  def test_validate_digits_with_valid_values
    data = [1,2,5]  
    expected = [1,2,5]    
    
    actual =InputProcessor.validate_data(data)   
    assert_equal expected,actual
  end 

  def test_add_numbers_with_valid_values
    data = [1,2,3]
    expected = 6
    actual = InputProcessor.add(data)
    assert_equal expected, actual
  end

  
end