require("io")
require("math")
require("string")
require("table")


print("Advent of Code: Day 1, Part II")


local function rows_from_file(file_path)
  local file = io.open(file_path, "r")
  local lines = {}
  for line in file:lines() do
    lines[#lines + 1] = line
  end
  file:close()
  return lines
end


local function split(s)
  -- split a string into a table of words
  local words = {}
  local i = 1
  for word in string.gmatch(s, "%w+") do
    words[i] = word
    i = i + 1
  end
  return words
end


local function extract_column(rows, col_num)
  local column = {}
  for i, row in ipairs(rows) do
    column[i] = split(row)[col_num]
  end
  return column
end


local function prepare_list(file, col_num)
  local rows = rows_from_file(file)
  local list = extract_column(rows, col_num)
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
