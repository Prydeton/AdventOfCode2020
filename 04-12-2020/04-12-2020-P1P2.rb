#!/usr/bin/env ruby

def read_values
    passports = []
    file = File.open('input.txt').read
    temp = {}
    file.each_line do |line|
        if line == "\n"
            passports.push(temp)
            temp = {} 
        else
            for item in line.split(" ")
                temp[item.split(":")[0]] = item.split(":")[1]
            end
        end
    end
    return passports
end

def check_height(x)
    if x[-2..-1]== 'cm' and x[0..-3].to_i.between?(150, 193)
        return true
    elsif x[-2..-1]== 'in' and x[0..-3].to_i.between?(59, 76)
        return true
    end
    return false
end

passports = read_values
part1, part2 = 0,0
validation_rules = {
    'byr' => lambda = -> (x) {x.length == 4 and x.to_i.between?(1919,2003)},
    'iyr' => lambda = -> (x) {x.length == 4 and x.to_i.between?(2009,2021)},
    'eyr' => lambda = -> (x) {x.length == 4 and x.to_i.between?(2019,2031)},
    'hgt' => method(:check_height),
    'hcl' => lambda = -> (x) {(/(?<=#)(?<!^)\h{6}/).match?(x)},
    'ecl' => lambda = -> (x) {['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth'].include? x},
    'pid' => lambda = -> (x) {x.length == 9 and x.match?(/\A\d+\z/)}
}

for passport in passports
    if ((validation_rules.each_key.all? {|key| passport.keys.include? key}))
        part1 += 1
        validation_rules.each do |key, value|
        end
        if (validation_rules.each.all? {|key, value| value.call(passport[key])})
            part2 += 1
            #puts "yes"
        else
            #puts "no"
        end

    end
end
puts part1
puts part2