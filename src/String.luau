--[=[
    @class StringUtils

    Helpful utility functions for manipulating and formatting strings.
]=]
local StringUtils = {}

--> Public Functions

--[=[
    Removes whitespace from the beginning and end of a string.

    @param value string -- The string to trim
    @return string -- The trimmed string
]=]
function StringUtils.Trim(value: string): string
	return value:match("^%s*(.-)%s*$") :: string
end

--[=[
    Checks if a string starts with another string.

    @param value string -- The string to search
    @param prefix string -- The prefix to check for
    @return boolean -- Whether the string starts with the prefix
]=]
function StringUtils.StartsWith(value: string, prefix: string): boolean
	return value:sub(1, #prefix) == prefix
end

--[=[
    Checks if a string ends with another string.

    @param value string -- The string to search
    @param suffix string -- The suffix to check for
    @return boolean -- Whether the string ends with the suffix
]=]
function StringUtils.EndsWith(value: string, suffix: string): boolean
	return value:sub(-#suffix) == suffix
end

--[=[
    Checks if a string contains another string.

    @param value string -- The string to search within
    @param search string -- The string to search for
    @return boolean -- Whether the string contains the search value
]=]
function StringUtils.Contains(value: string, search: string): boolean
	return value:find(search, 1, true) ~= nil
end

--[=[
    Capitalizes the first letter of a string.

    @param value string -- The string to capitalize
    @return string -- The capitalized string
]=]
function StringUtils.Capitalize(value: string): string
	return value:sub(1, 1):upper() .. value:sub(2)
end

--[=[
    Converts a string into PascalCase.

    @param value string -- The string to convert
    @return string -- The PascalCase string
]=]
function StringUtils.ToPascalCase(value: string): string
	local result = ""

	for word in value:gmatch("%w+") do
		result ..= word:sub(1, 1):upper() .. word:sub(2):lower()
	end

	return result
end

--[=[
    Converts a string into camelCase.

    @param value string -- The string to convert
    @return string -- The camelCase string
]=]
function StringUtils.ToCamelCase(value: string): string
	local pascal = StringUtils.ToPascalCase(value)

	return pascal:sub(1, 1):lower() .. pascal:sub(2)
end

--[=[
    Converts a string into snake_case.

    @param value string -- The string to convert
    @return string -- The snake_case string
]=]
function StringUtils.ToSnakeCase(value: string): string
	value = value:gsub("(%l)(%u)", "%1_%2")
	value = value:gsub("%s+", "_")

	return value:lower()
end

--[=[
    Converts a string into kebab-case.

    @param value string -- The string to convert
    @return string -- The kebab-case string
]=]
function StringUtils.ToKebabCase(value: string): string
	return StringUtils.ToSnakeCase(value):gsub("_", "-")
end

--[=[
    Removes all whitespace from a string.

    @param value string -- The string to modify
    @return string -- The string without whitespace
]=]
function StringUtils.RemoveWhitespace(value: string): string
	return value:gsub("%s+", "")
end

--[=[
    Shortens a string and adds an ellipsis.

    @param value string -- The string to shorten
    @param length number -- The maximum length of the result
    @return string -- The shortened string
]=]
function StringUtils.Shorten(value: string, length: number): string
	if #value <= length then
		return value
	end

	return value:sub(1, length - 3) .. "..."
end

--[=[
    Checks if a string is empty.

    @param value string -- The string to check
    @return boolean -- Whether the string is empty
]=]
function StringUtils.IsEmpty(value: string): boolean
	return value == ""
end

--[=[
    Checks if a string only contains whitespace.

    @param value string -- The string to check
    @return boolean -- Whether the string is blank
]=]
function StringUtils.IsBlank(value: string): boolean
	return StringUtils.Trim(value) == ""
end

--[=[
    Pads a string to a target length from the left side.

    @param value string -- The string to pad
    @param length number -- The target length
    @param character string? -- The character to use for padding (defaults to a space)
    @return string -- The padded string
]=]
function StringUtils.PadLeft(value: string, length: number, character: string?): string
	return string.rep(character or " ", math.max(0, length - #value)) .. value
end

--[=[
    Pads a string to a target length from the right side.

    @param value string -- The string to pad
    @param length number -- The target length
    @param character string? -- The character to use for padding (defaults to a space)
    @return string -- The padded string
]=]
function StringUtils.PadRight(value: string, length: number, character: string?): string
	return value .. string.rep(character or " ", math.max(0, length - #value))
end

return StringUtils
