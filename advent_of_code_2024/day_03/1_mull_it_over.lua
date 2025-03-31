require("string")
local lib = require("advent_of_code_2024.aoc_lib")


print("Advent of Code: Day 3, Part I")


local function read_input(file)
  local rows = lib.rows_from_file(file)
  return rows
end

local function find_valid_instructions(row)
  local valid_instructions = {}
  print(row)
  local result = string.find(row, 'mul(........')
  print(result)
end


local function main()
  local puzzle_input = "advent_of_code_2024/day_03/input.txt"
  local rows = read_input(puzzle_input)

  for _, row in ipairs(rows) do
    find_valid_instructions(row)
  end

end


main()
