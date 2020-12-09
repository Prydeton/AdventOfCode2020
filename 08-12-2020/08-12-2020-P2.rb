#!/usr/bin/env ruby

def read_values
    values = []
    file = File.open("input.txt").read
    file.each_line do |line|
        values.push(line.split(" "))
    end
    return values
end

def check_if_recursive(instructions)
    accumulator = 0
    previously_ran = []
    x = 0
    while x < instructions.length
        if previously_ran.include? x
            return -1
        end
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
    return accumulator
end

instructions = read_values
x = 0 
replacement = Hash.new
replacement["jmp"] = "nop"
replacement["nop"] = "jmp"
while x < instructions.length
    next if instructions[0] == "nop" or instructions[0] == "jmp"
    instructions_set_2 = read_values
    instructions_set_2[x][0] = replacement[instructions_set_2[x][0]]
    outcome = check_if_recursive(instructions_set_2)
    if outcome != -1
        puts outcome
    end
    x += 1
end

