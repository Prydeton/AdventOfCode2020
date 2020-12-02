#!/usr/bin/env ruby

def read_values
    values = Array.new
    file = File.open("values.txt").read
    file.each_line do |line|
        values.push(line)
    end
    return values
end

values = read_values()
valid_passwords = 0
for instance in values
    password_details = instance.split(' ')
    required_character = password_details[1].tr!(':', '')
    password = password_details[2]
    position_1 = password_details[0].split('-')[0].to_i()
    position_2 = password_details[0].split('-')[1].to_i()
    if (password[position_1 - 1] == required_character) ^ (password[position_2 - 1] == required_character)
        valid_passwords += 1
    end
end
puts valid_passwords
    