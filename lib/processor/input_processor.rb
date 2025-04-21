module InputProcessor

  def self.process_input(data)
    delimeters = [",","\n"]
    data = data.gsub("\\n", "\n")

    if data.start_with?"//"
      puts "Input delimeter is // #{data}"  
     match_str = data.match(/^\/\/\[(.*?)\]\n/)
     if match_str
      data.scan(/\[(.*?)\]/).each{|delim|delimeters.push(delim.first)}
      data = data.split("\n")[1]
     end    
     
    end         
    escaped_delimeters = delimeters.map { |d| Regexp.escape(d) }.join("|")  
    puts "escaped #{delimeters}"  
    return 0 if data.empty?
  
    if data.match(/\d*(#{escaped_delimeters})\d$/).nil?
        p "Please Enter valid input format"
    else     
        data = parse_data(data,escaped_delimeters)  
        return 0 if data.empty?
        data = validate_data(data)
        p add(data)
    end
  end

  def self.parse_data(data="",escaped_delimeters)       
    regex = Regexp.new(escaped_delimeters)   
    data = data.split(regex)    
    data.collect{|char| char.to_i}    
  end

  def self.validate_data(data)
    negatives = data.select{|digit| digit.negative?}
    raise StandardError,"negatives not allowed #{negatives}" unless negatives.empty?
    data.reject!{|digit| digit > 1000}
    return data
  end

  def self.add(numbers)
    sum = 0
    numbers.each{|num|sum+=num}
    sum
  end


end