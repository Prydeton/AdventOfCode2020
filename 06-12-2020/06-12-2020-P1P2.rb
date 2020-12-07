#!/usr/bin/env ruby

def read_values
    values = []
    file = File.open("input.txt")
    temp = []
    until file.eof()
        line = file.readline()
        if line == "\n"
            values.push(temp)
            temp = []
        else    
            line.delete!("\n")
            temp.push(line.split(""))
        end
    end
    return values
end


values = read_values
part1, part2= 0,0
for group in values
    part1 += group.inject(:+).uniq.length
    part2 += group.inject(:&).length
end
puts part1
puts part2