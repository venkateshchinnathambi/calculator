module InputProcessor

  def self.process_input(data)
    delimeters = [",","\n"]
    if data.start_with?"//"
      puts "Input delimeter is // #{data}"    
    end
    #TODO : Add Regex
    delimeters = delimeters.each{|d| Regexp.escape(d)}
    data = parse_data(data,delimeters)
    return 0 if data.empty?
  end

  def self.parse_data(data="",delimeters=[])    
    regex = Regexp.new(delimeters.join("|"))
    data = data.split(regex)
    data.collect{|char| char.to_i}    
  end

  def self.validate_data(data)
    negatives = data.select{|digit| digit.negative?}
    raise StandardError,"negatives not allowed #{negatives}" unless negatives.empty?
    return data
  end

  def self.add(numbers)
    sum = 0
    numbers.each{|num|sum+=num}
    sum
  end


end