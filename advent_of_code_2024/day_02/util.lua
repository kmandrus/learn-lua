require("math")
require("table")
require("io")
local lib = require("advent_of_code_2024.aoc_lib")


local M = {}


function M.parse_report(raw_report)
  -- convert a string of space separated numbers to a table of numbers
  local report = {}
  local level_strs = lib.split(raw_report)
  for i, level_str in ipairs(level_strs) do
    report[i] = tonumber(level_str)
  end
  return report
end


function M.load_reports(file)
  local rows = lib.rows_from_file(file)
  local reports = {}
  for i, row in ipairs(rows) do
    reports[i] = M.parse_report(row)
  end
  return reports
end


function M.print_report(report)
  for _, level in ipairs(report) do
    io.write(level .. " ")
  end
  io.write("\n")
end


function M.get_deltas(report)
  local deltas = {}
  for i=1,#report -1 do
    deltas[i] = report[i+1] - report[i]
  end
  return deltas
end


function M.are_levels_increasing(report)
  local result = true
  for _, delta in ipairs(M.get_deltas(report)) do
    if delta <= 0 then result = false end
  end 
  return result
end


function M.are_levels_decreasing(report)
  local result = true
  for _, delta in ipairs(M.get_deltas(report)) do
    if delta >= 0 then result = false end
  end
  return result
end


function M.are_deltas_small(report)
  local result = true
  for _, delta in ipairs(M.get_deltas(report)) do
    if math.abs(delta) > 3 then result = false end
  end
  return result
end


function M.is_safe(report)
  if (M.are_levels_increasing(report) or M.are_levels_decreasing(report)) and M.are_deltas_small(report) then
    return true
  end
  return false
end


function M.count_safe(reports, is_safe_func)
  local count = 0
  for _, report in ipairs(reports) do
    if is_safe_func(report) then count = count + 1 end
  end
  return count
end


return M
