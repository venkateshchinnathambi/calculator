module InputProcessor

  def self.process_input(data)
    if data.start_with?"//"
      puts "Input delimeter is // #{data}"
    else
      puts "Input delimeter is ,or\n #{data}"
    end
    #TODO : Add Regex
    parse_data(data,delimeters)
  end

  def self.parse_data(data="",delimeters=[])
    return 0 if data.empty?
    #TODO : call validatore
  end

  def validate_data(data)
    #TODO : Validate for legimate data
  end

  def add(numbers)
  end


end