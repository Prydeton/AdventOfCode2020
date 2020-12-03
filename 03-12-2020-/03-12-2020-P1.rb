#!/usr/bin/env ruby

def read_values
    map = Array.new
    file = File.open("map.txt").read
    file.each_line do |line|
        line.gsub!("\n", "")
        map.push(line.chars)
    end
    return map
end

x = 0
y = 0
tree_count = 0
map = read_values()
puts map.length

while y < map.length() - 1
    if x + 3 > map[0].length() - 1
        x = (x - map[0].length + 3)
    else
        x += 3
    end
    y += 1
    if map[y][x] == "#"
        tree_count += 1
        puts tree_count
    end
end