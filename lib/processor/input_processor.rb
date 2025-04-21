module InputProcessor

  def self.process_input(data)
    delimeters = [",","\n"]
    if data.start_with?"//"
      puts "Input delimeter is // #{data}"  
      #TODO : Add custom delimeters  
    end     
    data = data.gsub("\\n", "\n")
    return 0 if data.empty?
    if data.match(/\d*(,|\n)\d$/).nil?
      p "Please Enter valid input format"
    else     
      data = parse_data(data,delimeters)  
      return 0 if data.empty?
      data = validate_data(data)
      p add(data)
    end
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