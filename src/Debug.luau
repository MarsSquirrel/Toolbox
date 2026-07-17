--[=[
	@class DebugUtils

	Helpful utility functions for debugging Roblox games and inspecting runtime data.
]=]
local DebugUtils = {}

--> Dependencies

local PlayerUtils = require(script.Parent.Player)

--> Public Functions

--[=[
	Prints a table recursively with indentation.

	@param value {[any]: any} -- The table to print
	@param depth number? -- The current indentation depth (defaults to 0)
]=]
function DebugUtils.PrintTable(value: { [any]: any }, depth: number?)
	local indentation = string.rep("  ", depth or 0)

	for key, item in value do
		if type(item) == "table" then
			print(`{indentation}{tostring(key)}:`)
			DebugUtils.PrintTable(item, (depth or 0) + 1)
		else
			print(`{indentation}{tostring(key)} = {tostring(item)}`)
		end
	end
end

--[=[
	Prints an instance hierarchy and its class names.

	@param instance Instance -- The instance to inspect
	@param depth number? -- The current indentation depth (defaults to 0)
]=]
function DebugUtils.PrintInstanceTree(instance: Instance, depth: number?)
	print(`{string.rep("  ", depth or 0)}{instance.Name} ({instance.ClassName})`)

	for _, child in instance:GetChildren() do
		DebugUtils.PrintInstanceTree(child, (depth or 0) + 1)
	end
end

--[=[
	Prints detailed information about a player, including their character, tools, leaderstats, and attributes.

	@param player Player -- The player to dump information about
]=]
function DebugUtils.DumpPlayer(player: Player)
	print("========== Player Dump ==========")

	print(`Name: {player.Name}`)
	print(`Display Name: {player.DisplayName}`)
	print(`UserId: {player.UserId}`)
	print(`Account Age: {player.AccountAge} days`)
	print(`Membership: {player.MembershipType.Name}`)

	print("\n--- Character ---")

	local character = player.Character

	if character then
		print(`Character: {character:GetFullName()}`)

		local humanoid = PlayerUtils.GetHumanoid(player)
		local root = PlayerUtils.GetRoot(player)

		print(`Humanoid: {humanoid and "Found" or "Missing"}`)
		print(`Health: {humanoid and humanoid.Health or "N/A"}`)
		print(`Root Position: {root and tostring(root.Position) or "Missing"}`)
	else
		print("Character: Missing")
	end

	print("\n--- Tools ---")

	local tools = PlayerUtils.GetTools(player)

	if #tools == 0 then
		print("No tools")
	else
		for _, tool in tools do
			local equipped = tool.Parent == character

			print(`{tool.Name} | Equipped: {equipped}`)
		end
	end

	print("\n--- Leaderstats ---")

	local leaderstats = PlayerUtils.GetLeaderstats(player)

	if leaderstats then
		for _, value in leaderstats:GetChildren() do
			if value:IsA("ValueBase") then
				print(`{value.Name}: {value.Value}`)
			else
				print(`{value.Name}: ({value.ClassName})`)
			end
		end
	else
		print("No leaderstats")
	end

	print("\n--- Attributes ---")

	local attributes = player:GetAttributes()

	if next(attributes) then
		for name, value in attributes do
			print(`{name}: {value}`)
		end
	else
		print("No attributes")
	end

	print("=================================")
end

return DebugUtils
