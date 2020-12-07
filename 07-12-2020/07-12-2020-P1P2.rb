#!/usr/bin/env ruby

def read_values
    map = Array.new
    file = File.open("map.txt").read
    file.each_line do |line|
        line.gsub!("\n", "")
        
    end
    return map
end

def parse_rule(rule_str)
    if rule_str.include?("no other bags")
      return {}
    else
      return {
        "quantity" => rule_str.strip.match(/^\d+/)[0],
        "color" => rule_str.strip.match(/(\w+\s\w+)\sbag/)[1]
      }
    end
  end
  
  def bags_for_color(bags,color)
    output = []
    bags.each do|bag,rules|
      rules.select{|r|r.length >0}.each do |rule|
        if rule["color"] == color
          output << bag
          output.concat bags_for_color(bags,bag)
        end
      end
    end
    output
  end
    
  def total_for_color(bags,color)
    total = 1
    bags[color].each do |rule|
      if rule != {}
        total += rule["quantity"].to_i * total_for_color(bags, rule["color"])
      end
    end
    total
  end
  
  bags = {}
  file = File.open("input.txt").read
  file.each_line do |line|
    bag = line.match(/(^\w+\s\w+)\sbags/)[1]
    rules = line.split("contain")[1].split(',')
    bags[bag] = rules.map do |rule|
      parse_rule(rule)
    end
  end
  
  puts "part 1"
  puts bags_for_color(bags,"shiny gold").uniq.length
  
  puts "part 2"
  puts total_for_color(bags,"shiny gold") - 1