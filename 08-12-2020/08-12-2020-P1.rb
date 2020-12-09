#!/usr/bin/env ruby

def read_values
    values = []
    file = File.open("input.txt").read
    file.each_line do |line|
        values.push(line.split(" "))
    end
    return values
end

instructions = read_values
accumulator = 0
previously_ran = []
x = 0
while x <= instructions.length and not previously_ran.include? x
    previously_ran.push(x)
    if instructions[x][0] == "acc"
        accumulator += instructions[x][1].to_i
        x += 1
    elsif instructions[x][0] == "jmp"
        x += instructions[x][1].to_i
    elsif instructions[x][0] == "nop"
        x += 1
    end
end
puts accumulator
