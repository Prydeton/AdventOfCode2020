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
    min = password_details[0].split('-')[0].to_i()
    max = password_details[0].split('-')[1].to_i()
    count = 0
    password.each_char() { |character|
        if character == required_character
            count += 1
        end
    }
    if count >= min and count <= max
        valid_passwords += 1
    end
end
puts valid_passwords