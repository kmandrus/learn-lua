require("io")
require("math")
require("string")
require("table")


print("Advent of Code: Day 1, Part I")


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
