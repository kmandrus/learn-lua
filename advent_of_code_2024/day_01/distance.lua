require("io")
require("string")


print("running distance.lua")


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

local puzzle_input = "advent_of_code_2024/day_01/input.txt"
local rows = rows_from_file(puzzle_input)
first_column = extract_column(rows, 1)
second_column = extract_column(rows, 2)
