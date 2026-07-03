# Someutils documentation

a library that has a bunch of random stuff... because WHY NOT!

## Table of Contents
- [su.decimalToHexadecimal(number)](#sudecimaltohexadecimalnumber)
- [su.decimalToBinary(number)](#sudecimaltobinarynumber)
- [su.clear(x, y)](#suclearx-y)
- [su.overwriteLine(text, y)](#suoverwritelinetext-y)
- [su.centerText(text, y)](#sucentertexttext-y)
- [su.quickMenu(title, options)](#suquickmenutitle-options)
- [su.quickReadFile(path)](#suquickreadfilepath)
- [su.quickWriteFile(path, content)](#suquickwritefilepath-content)
- [su.quickAppendFile(path, content)](#suquickappendfilepath-content)
- [su.calcTextScale(scale)](#sucalctextscalescale)
- [su.randomFloat(float, float2, decimals)](#surandomfloatfloat-float2-decimals)
- [su.roundDownFloat(float, decimals)](#surounddownfloatfloat-decimals)
- [su.chance(percentage)](#suchancepercentage)
- [su.formatInt(num)](#suformatintnum)


## su.decimalToHexadecimal(number)
Converts a decimal number to hexadecimal

**Parameters**

1. **number** The number to convert

**Returns**

1. **string** The hexadecimal string

## su.decimalToBinary(number)
Converts a decimal number to binary

**Parameters**

1. **number** The number to convert

**Returns**

1.**number** The binary number

## su.clear(x, y)
Clears the screen and moves the cursor to `x` and `y`

However if `x` and `y` is empty then it will move the cursor to `1`, `1`

**Parameters**

1. <abbr title="Optional">***x : number***</abbr> The new x position of the cursor

2.  <abbr title="Optional">***y : number***</abbr>The new y position of the cursor

## su.overwriteLine(text, y)

Lets you overwrite a line so that you can make progress bars.. sorta

**Parameters**

1. **text : any** The text to overwrite

2. <abbr title="Optional">***y : number***</abbr> The y level to overwrite the text at

## su.centerText(text, y)

Writes text to the center of the screen

You can type `center` in `y` to put it right in the center

If y is nil then it will default to the cursor y position

**Parameters**

1. **text : any** The text to write in the center

2. <abbr title="Optional">***y : number***</abbr> The y position to write the text at

## su.quickMenu(title, options)

Make some quick menus which can be useful sometimes yk

**Parameters**

1. **title : string** The title of the menu

2. **options : table** A table of all the options

**Returns**

1. **option : number** The option that was selected

**Example**

```lua
local su = require(someutils)
local menu = su.quickMenu("Test Menu", {"Option 1", "Option 2", "Option 3"})

if menu == 1 then
    print("Option 1 was selected!")
elseif menu == 2 then
    print("Option 2 was selected!")
elseif menu == 3 then
    print("Option 3 was selected!")
end
```

## su.quickReadFile(path)

Quickly read a file because having to do all the file = fs.open() stuff is annoying (or is it just me?)

**Parameters**

1. **path : string** The path to read from

**Returns**

1. **content : any** The content from the file

## su.quickWriteFile(path, content)

Just like su.quickReadFile(), it lets you quickly write files

**Parameters**

1. **path : string** The path to write to

2. **content : any** The content to write to said path

## su.quickAppendFile(path, content)

I swear this is the last one

**Parameters**

1. **path : string** The path to append to

2. **content : any** The content to append to said path

## su.calcTextScale(scale)

Calculates the text scale for monitors

**Parameters**

1. <abbr title="Optional">***scale : number***</babbr> How much to scale the final result if too big/small

**Returns**

1. **text_scale : number** The calculated scale

## su.randomFloat(float, float2, decimals)

Gives you a random float between 2 ranges and you can round down

However, if `decimals` is nil then there is no rounding

**Parameters**

1. **float : number** The first float in the range

2. **float2 : number** The second float in the range

3. <abbr title="Optional">***decimals : number***</abbr> How many decimals to round down

## su.roundDownFloat(float, decimals)

Rounds down a float to the specified amount of decimals

**Parameters**

1. **float : number** The float to round down

2. **decimals : number** How many decimals to round down

## su.chance(percentage)

A quick way to check for a specific percentage for like coinflips, and stuff idk

**Parameters**

1. **percentage : number** The percentage to check for

**Returns**

1. **boolean** If the check passed

## su.formatInt(num)

Formats a number to look good

**Parameters**

1. **num : number** The number to format

**Returns**

1. **formattedNum : string** The formatted number
