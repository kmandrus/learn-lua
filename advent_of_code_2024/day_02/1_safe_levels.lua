util = require("advent_of_code_2024.day_02.util")


print("Advent of Code: Day 2, Part I")


local function count_safe(reports)
  local count = 0
  for _, report in ipairs(reports) do
    if util.is_safe(report) then count = count + 1 end
  end
  return count
end


local function main()
  local puzzle_input = "advent_of_code_2024/day_02/input.txt"
  local reports = util.load_reports(puzzle_input)
  print("Number of safe reports: " .. count_safe(reports))
end

main()


