#!/usr/bin/env ruby

def read_values
    values = Array.new
    file = File.open("values.txt").read
    file.gsub!(/\r\n?/, "\n")
    file.each_line do |line|
        values.push(line.to_i)
    end
    values.sort!
    return values
end

values = read_values()
x = 0
y = values.length - 1
solving = true

while solving
    if values[x] + values[y] == 2020
        puts values[x] * values[y]
        solving = false
    elsif values[x] + values[y] > 2020
        y -= 1
    else
        x += 1
    end
end