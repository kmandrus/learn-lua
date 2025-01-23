require("math")
require("table")
local lib = require("advent_of_code_2024.aoc_lib")


print("Advent of Code: Day 1, Part I")


local function prepare_list(file, col_num)
  local rows = lib.rows_from_file(file)
  local list = lib.extract_column(rows, col_num)
  table.sort(list)
  return list
end


local function compute_total_distance(left_list, right_list)
  local sum = 0
  for i=1, #left_list do
    local d = math.abs(left_list[i] - right_list[i])
    -- print("The distance between " .. left_list[i] .. " and " .. right_list[i] .. " is " .. d)
    sum = sum + d
  end
  return sum
end

local function main()
  local puzzle_input = "advent_of_code_2024/day_01/input.txt"
  local left_list = prepare_list(puzzle_input, 1)
  local right_list = prepare_list(puzzle_input, 2)
  local sum = compute_total_distance(left_list, right_list)

  print("The sum of the distances is " .. sum .. ".")
end


main()
