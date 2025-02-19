local lib = require("advent_of_code_2024.aoc_lib")
local util = require("advent_of_code_2024.day_02.util")
require("table")


local function create_dampenend_reports(report)
  local dampened_reports = {}
  for i=1,#report do
    local dampened_report = lib.copy_table(report)
    table.remove(dampened_report, i)
    dampened_reports[i] = dampened_report
  end
  return dampened_reports
end


local function is_safe_with_dampening(report)
  local all_reports = create_dampenend_reports(report)
  table.insert(all_reports, report)
  for _, r in ipairs(all_reports) do
    if util.is_safe(r) then return true end
  end
  return false
end


local function main()
  local puzzle_input = "advent_of_code_2024/day_02/input.txt"
  local reports = util.load_reports(puzzle_input)
  print("Safe Reports: " .. util.count_safe(reports, is_safe_with_dampening))
end

main()
