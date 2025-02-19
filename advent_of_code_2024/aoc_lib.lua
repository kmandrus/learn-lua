require("io")
require("string")


local M = {}


function M.rows_from_file(file_path)
  local file = io.open(file_path, "r")
  local lines = {}
  for line in file:lines() do
    lines[#lines + 1] = line
  end
  file:close()
  return lines
end


function M.split(s)
  -- split a string into a table of words
  local words = {}
  local i = 1
  for word in string.gmatch(s, "%w+") do
    words[i] = word
    i = i + 1
  end
  return words
end


function M.extract_column(rows, col_num)
  -- assumes columns in the text file are space separated
  local column = {}
  for i, row in ipairs(rows) do
    column[i] = M.split(row)[col_num]
  end
  return column
end


function M.copy_table(t)
  -- creates a shallow copy of a table
  local copied_table = {}
  for k, v in pairs(t) do
    copied_table[k] = v
  end
  return copied_table
end



return M
