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

map = read_values()
counts = Array.new
loop do
    x = 0
    y = 0
    tree_count = 0
    puts "Enter value to go right: "
    right = gets.to_i
    puts "Enter value to go down: "
    down = gets.to_i
    while y < map.length() - 1
        if x + right > map[0].length() - 1
            x = (x - map[0].length + right)
        else
            x += right
        end
        y += down
        if map[y][x] == "#"
            tree_count += 1
        end
    end
    counts.push(tree_count)
    puts "Again? [y/n]"
    choice = gets.gsub!("\n", "")
    if choice == 'n'
        break
    end
end
    puts counts.inject(:*)

