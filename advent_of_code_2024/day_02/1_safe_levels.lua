local lib = require("advent_of_code_2024.aoc_lib")
require("math")


print("Advent of Code: Day 2, Part I")

local function parse_report(raw_report)
  -- convert a string of space separated numbers to a table of numbers
  report = {}
  level_strs = lib.split(raw_report)
  for i, level_str in ipairs(level_strs) do
    report[i] = tonumber(level_str)
  end
  return report
end

local function get_deltas(report)
  deltas = {}
  for i=1,#report -1 do
    deltas[i] = report[i+1] - report[i]
  end
  return deltas
end

local function are_levels_increasing(report)
  local result = true
  for _, delta in ipairs(get_deltas(report)) do
    if delta <= 0 then result = false end
  end 
  return result
end

local function are_levels_decreasing(report)
  local result = true
  for _, delta in ipairs(get_deltas(report)) do
    if delta >= 0 then result = false end
  end
  return result
end

local function are_deltas_small(report)
  local result = true
  for _, delta in ipairs(get_deltas(report)) do
    if math.abs(delta) > 3 then result = false end
  end
  return result
end

local function is_safe(report)
  if (are_levels_increasing(report) or are_levels_decreasing(report)) and are_deltas_small(report) then
    return true
  end
  return false
end

local function count_safe(reports)
  local count = 0
  for _, report in ipairs(reports) do
    if is_safe(report) then count = count + 1 end
  end
  return count
end

local function main()
  local puzzle_input = "advent_of_code_2024/day_02/input.txt"
  local rows = lib.rows_from_file(puzzle_input)
  local reports = {}
  for i, row in ipairs(rows) do
    reports[i] = parse_report(row)
  end
  print("Number of safe reports: " .. count_safe(reports))
end

main()


