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
for i in 0...values.length - 2
    j = i + 1
    k = values.length - 1
    while j < k
        if values[j] + values[k] + values[i] == 2020
            puts values[j] * values[k] * values[i]
            break
        elsif values[j] + values[k] + values[i] > 2020
            k -= 1
        else
            j += 1
        end
    end
end
