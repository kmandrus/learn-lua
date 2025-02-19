local util = require("advent_of_code_2024.day_02.util")


print("Advent of Code: Day 2, Part I")


local function main()
  local puzzle_input = "advent_of_code_2024/day_02/input.txt"
  local reports = util.load_reports(puzzle_input)
  print("Number of safe reports: " .. util.count_safe(reports, util.is_safe))
end

main()


