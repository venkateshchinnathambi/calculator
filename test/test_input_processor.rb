require "./test_helper"

class InputProcessorTest < Minitest::Test

  def test_parse_data_with_valid_values_comma_seperated
    expected = [2,4]
    input = "2,4"
    delimeters = [","]
    escaped_delimeters = delimeters.map { |d| Regexp.escape(d) }.join("|")  
    actual = InputProcessor.parse_data(input,escaped_delimeters)    
    assert_equal expected, actual
  end

  def test_parse_data_with_valid_value_comman_and_newline
    expected = [2,4,5]
    input = "2\n4\n5"
    delimeters = [",","\n"]     
    escaped_delimeters = delimeters.map { |d| Regexp.escape(d) }.join("|")    
    actual = InputProcessor.parse_data(input,escaped_delimeters)       
    assert_equal expected, actual
  end

  def test_parse_data_with_empty_values
    input = ""
    expected = []
    delimeters = [",","\n"]    
    escaped_delimeters = delimeters.map { |d| Regexp.escape(d) }.join("|")    
    actual = InputProcessor.parse_data(input,escaped_delimeters)   
    assert_equal expected, actual
  end

  def test_process_input_with_empty
    input = ""
    expected = 0
    actual = InputProcessor.process_input(input)
    assert_equal expected, actual
  end

  def test_parse_data_with_valid_values_with_invalid_delimeter
    expected = "Please Enter valid input format"
    input = "1,\n"
    actual = InputProcessor.process_input(input)    
    assert_equal expected, actual
  end

  def test_parse_data_with_valid_values_with_invalid_delimeter_with_extra_comma
    expected = "Please Enter valid input format"
    input = "1,2,"
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

  def test_validate_data_with_value_greater_than_range
    data = [1,1001,5]  
    expected = [1,5]    
    
    actual =InputProcessor.validate_data(data)   
    assert_equal expected,actual
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

  def test_process_input_with_valid_input
    input = "1\n5\n6"
    expected = 12
    actual = InputProcessor.process_input(input)
    assert_equal expected,actual
  end

  def test_process_input_with_in_valid_input
    input = "1\n5\n-6"
    expected = "negatives not allowed [-6]"
    errors = assert_raises(StandardError) do 
       InputProcessor.process_input(input)
    end
    assert_equal expected,errors.message
  end

  def test_process_input_with_valid_input_with_comma
    input = "1\n5,6"
    expected = 12
    actual = InputProcessor.process_input(input)
    assert_equal expected,actual
  end

def test_process_input_with_custom_delimeter
  input = "//[*][#]\n1*2#5"
  expected = 8
  actual = InputProcessor.process_input(input)
  assert_equal expected,actual
end
def test_process_input_with_custom_delimeter
  input = "//[**][%][##]\n1**2##5%2"
  expected = 10
  actual = InputProcessor.process_input(input)
  assert_equal expected,actual
end
def test_process_input_with_custom_delimeter
  input = "//[**][%][##]\n1**2#5%2"
  expected = 5
  actual = InputProcessor.process_input(input)
  assert_equal expected,actual
end
def test_process_input_with_custom_delimeter_invalid_delim
  input = "//[**][%][##]\n1**2#5%2**"
  expected = "Please Enter valid input format"
  actual = InputProcessor.process_input(input)
  assert_equal expected,actual
end
end