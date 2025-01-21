require("io")


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

local puzzle_input = "input.txt"
rows = rows_from_file(puzzle_input)

local function extract_column(col_num)
  print(col_num)
end
