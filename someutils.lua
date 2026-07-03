---@diagnostic disable: param-type-mismatch, lowercase-global
math.randomseed(os.epoch("utc"))

-- conversion
---@param num number
---@return string
local function decimalToHexadecimal(num)
    if num == nil then
        error("number argument missing!")
    end
    local hexNum = string.format("%X", num)
    return hexNum
end
---@param num number
---@return number|string
local function decimalToBinary(num)
    if num == nil then
        error("number argument missing!")
    end
 
    if tonumber(num) == 0 then
        return "0"
    end
    local binaryNum = ""

    while tonumber(num) > 0 do
        local remainder = num % 2
        binaryNum = remainder .. binaryNum
        num = math.floor(num / 2)
    end

    return binaryNum
end

-- shortcuts/useful stuff
---@param x number?
---@param y number?
local function clear(x, y)
    term.clear()
    if x == nil and y == nil then
        term.setCursorPos(1, 1)
    else
        term.setCursorPos(x, y)
    end
end
---@param text string
---@param y number?
local function overwriteLine(text, y)
    if text == nil then
        error("text argument missing!")
    end
    local cx, cy = term.getCursorPos()
    local targetY = y or cy -- Use specified line, or stay on current line
    
    term.setCursorPos(1, targetY)
    term.clearLine()
    term.write(text)
end
---@param text string
---@param y number|string?
local function centerText(text, y)
    local terminal_x, terminal_y = term.getSize()
    local center_x = math.floor((terminal_x - string.len(text)) / 2) + 1
    local previous_x, previous_y = term.getCursorPos()
    
    local targetY = y or previous_y
    if y == "center" then
        targetY = math.floor(terminal_y / 2)
    end
    
    term.setCursorPos(center_x, targetY)
    term.write(text)
    term.setCursorPos(previous_x, previous_y)
end
---@param title string 
---@param options table
local function quickMenu(title, options)
    clear()
    print("--- " .. title .. " ---\n")
    
    for index, optionName in ipairs(options) do
        print(index .. ". " .. optionName)
    end
    
    while true do
        local event, character = os.pullEvent("char")
        local num = tonumber(character)
        
        if num and num >= 1 and num <= #options then
            return num, options[num]
        end
    end
end

--file stuff
---@param path string
---@return string|nil
local function quickReadFile(path)
   if not fs.exists(path) then return nil end
   local file = fs.open(path, "r")
   if not file then return nil end
   local content = file.readAll()
   file.close()
   return content
end
---@param path string
---@param content any
---@return nil|boolean
local function quickWriteFile(path, content)
   local file = fs.open(path, "w")
   if not file then return nil end
   file.write(content)
   file.close()
   return true
end
---@param path string
---@param content any
---@return nil|boolean
local function quickAppendFile(path, content)
    local file = fs.open(path, "a")
    if not file then return nil end
    file.write(content)
    file.close()
    return true
end

-- monitor stuff
---@param scale number
---@return number|nil
local function calcTextScale(scale)
    local mon = peripheral.find("monitor")
    -- check if the monitor exists and if not then return nil
    if mon == nil then
        return nil
    end
    local x,y = mon.getSize()
    local tscale = x / (x / 2)
    if scale == nil then
        return tscale
    else
        return tscale * scale
    end
end

-- math / number stuff
---@param float number
---@param float2 number
---@param decimals number?
---Generates a random float between 2 floats and can be rounded down
local function randomFloat(float, float2, decimals)
    local raw_random = float + math.random() * (float2 - float)
    
    -- If decimals is provided and greater than 0, round the number
    if decimals and decimals > 0 then
        local multiplier = 10 ^ decimals
        return math.floor(raw_random * multiplier) / multiplier
    end
    
    return raw_random
end
---@param float number
---@param decimals number
---Rounds down a float to a specified amount of decimals
local function roundDownFloat(float, decimals)
    -- this code is taked from randomFloat lol
    if not decimals then
        return nil
    else
        local multiplier = 10 ^ decimals
        return math.floor(float * multiplier) / multiplier
    end
end
---@param percentage number
---@return boolean
---Lets you get a quick percentage check
local function chance(percentage)
    return (math.random() * 100) <= percentage
end
---@param num number
---@return string
---Lets you format a integer
local function formatInt(num)
    formattedNum = tostring(num)
    while true do
        -- this is like the dumbest formatting                  ↓
        formattedNum, x = string.gsub(formattedNum, "^(-?%d+)(%d%d%d)", "%1,%2")
        if x == 0 then
            break
        end
      --  print(formattedNum)
     --   sleep(0.001)
    end
    return formattedNum
end

-- made it more beautiful
return {
    decimalToHexadecimal = decimalToHexadecimal, 
    decimalToBinary = decimalToBinary, 
    clear = clear, 
    calcTextScale = calcTextScale, 
    overwriteLine = overwriteLine, 
    quickReadFile = quickReadFile, 
    quickWriteFile = quickWriteFile, 
    quickAppendFile = quickAppendFile, 
    randomFloat = randomFloat, 
    roundDownFloat = roundDownFloat, 
    chance = chance, 
    formatInt = formatInt,
    centerText = centerText, 
    quickMenu = quickMenu
}