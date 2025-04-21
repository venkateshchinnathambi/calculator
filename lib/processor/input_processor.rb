module InputProcessor

  def self.process_input(data)
    delimeters = [",","\n"]
    if data.start_with?"//"
      puts "Input delimeter is // #{data}"    
    end
    #TODO : Add Regex
    delimeters = delimeters.each{|d| Regexp.escape(d)}
    data = parse_data(data,delimeters)
  end

  def self.parse_data(data="",delimeters=[])    
    regex = Regexp.new(delimeters.join("|"))
    data = data.split(regex)
    data.collect{|char| char.to_i}    
  end

  def validate_data(data)
    #TODO : Validate for legimate data
  end

  def add(numbers)
  end


end