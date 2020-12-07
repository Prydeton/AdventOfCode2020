#!/usr/bin/env ruby

def read_values
    values = Array.new
    file = File.open("values.txt").read
    file.each_line do |line|
        values.push(line)
    end
    return values
end

values = read_values
seat_ids = []
for row in values
    min_row = 0
    max_row = 127
    min_column = 0
    max_column = 7
    row.split('').each { |c|
        if c == "F"
            max_row = min_row + ((max_row - min_row) / 2)
        elsif c == "B"
            min_row = min_row + ((max_row - min_row) / 2) + 1
        elsif c == "R"
            min_column = min_column + ((max_column - min_column) / 2) + 1
        elsif c == "L"
            max_column = min_column + ((max_column - min_column) / 2)
        end
    }
    seat_ids.push(max_row * 8 + max_column)
end

puts("Part 1")
puts seat_ids.max
seat_ids.sort!
for i in (seat_ids[0]..seat_ids.max)
    if i != seat_ids[i - seat_ids[0]]
        puts("Part 2")
        puts i
        break
    end
end

