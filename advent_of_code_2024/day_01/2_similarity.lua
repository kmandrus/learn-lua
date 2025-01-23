require("table")
local lib = require("advent_of_code_2024.aoc_lib")


print("Advent of Code: Day 1, Part II")


local function prepare_list(file, col_num)
  local rows = lib.rows_from_file(file)
  local list = lib.extract_column(rows, col_num)
  table.sort(list)
  return list
end


local function count_occurrences(list)
  -- create count table with zero as its default value
  local count = {}
  local zero_default_mt = {__index = function() return 0 end}
  setmetatable(count, zero_default_mt)
  for _, num in pairs(list) do
    count[num] = count[num] + 1
  end
  return count
end


local function compute_similarity(list, occurrences)
  local total_score = 0
  for _, num in pairs(list) do
    total_score = total_score + (num * occurrences[num])
  end
  return total_score
end


local function main()
  local puzzle_input = "advent_of_code_2024/day_01/input.txt"
  local left_list = prepare_list(puzzle_input, 1)
  local right_occurrences = count_occurrences(prepare_list(puzzle_input, 2))
  print("Similarity Score: " .. compute_similarity(left_list, right_occurrences))
end


main()
