--[=[
    @class PlayerUtils

    Helpful utility functions for Roblox Players, characters, tools, and player state.
]=]
local PlayerUtils = {}

--> Roblox Services

local Players = game:GetService("Players")

--> Dependencies

local InstanceUtils = require(script.Parent.Instance)

--> Public Functions

--[=[
    Waits for a player's character to load.

    @param player Player -- The player to wait for
    @return Model? -- The player's character model
]=]
function PlayerUtils.WaitForCharacter(player: Player): Model?
	if player.Character then
		return player.Character
	end

	local character = player.CharacterAdded:Wait()

	return character
end

--[=[
    Gets a player's humanoid.

    @param player Player -- The player to get the humanoid from
    @return Humanoid? -- The player's humanoid
]=]
function PlayerUtils.GetHumanoid(player: Player): Humanoid?
	local character = player.Character

	if not character then
		return nil
	end

	return character:FindFirstChildWhichIsA("Humanoid")
end

--[=[
    Waits for a player's humanoid to load.

    @param player Player -- The player to wait for
    @return Humanoid? -- The player's humanoid
]=]
function PlayerUtils.WaitForHumanoid(player: Player): Humanoid?
	local character = PlayerUtils.WaitForCharacter(player)

	if not character then
		return nil
	end

	return character:WaitForChild("Humanoid") :: Humanoid
end

--[=[
    Gets a player's root part.

    @param player Player -- The player to get the root part from
    @return BasePart? -- The player's HumanoidRootPart
]=]
function PlayerUtils.GetRoot(player: Player): BasePart?
	local character = player.Character

	if not character then
		return nil
	end

	return character:FindFirstChild("HumanoidRootPart") :: BasePart?
end

--[=[
    Waits for a player's root part.

    @param player Player -- The player to wait for
    @return BasePart? -- The player's HumanoidRootPart
]=]
function PlayerUtils.WaitForRoot(player: Player): BasePart?
	local character = PlayerUtils.WaitForCharacter(player)

	if not character then
		return nil
	end

	return character:WaitForChild("HumanoidRootPart") :: BasePart
end

--[=[
    Checks if a player is alive.

    @param player Player -- The player to check
    @return boolean -- Whether the player's humanoid exists and has health remaining
]=]
function PlayerUtils.IsAlive(player: Player): boolean
	local humanoid = PlayerUtils.GetHumanoid(player)

	return humanoid ~= nil and humanoid.Health > 0
end

--[=[
    Gets a player's current position.

    @param player Player -- The player to get the position from
    @return Vector3? -- The player's world position
]=]
function PlayerUtils.GetPosition(player: Player): Vector3?
	local root = PlayerUtils.GetRoot(player)

	if not root then
		return nil
	end

	return root.Position
end

--[=[
    Gets the distance between two players.

    @param player1 Player -- The first player
    @param player2 Player -- The second player
    @return number? -- The distance between players
]=]
function PlayerUtils.GetDistance(player1: Player, player2: Player): number?
	local position1 = PlayerUtils.GetPosition(player1)
	local position2 = PlayerUtils.GetPosition(player2)

	if not position1 or not position2 then
		return nil
	end

	return (position1 - position2).Magnitude
end

--[=[
    Gets all players within a radius of a player.

    @param origin Player -- The center player
    @param radius number -- The maximum distance
    @return {Player} -- Players within the specified radius
]=]
function PlayerUtils.GetPlayersInRadius(origin: Player, radius: number): { Player }
	local result = {}
	local originPosition = PlayerUtils.GetPosition(origin)

	if not originPosition then
		return result
	end

	for _, player in Players:GetPlayers() do
		if player ~= origin then
			local position = PlayerUtils.GetPosition(player)

			if position and (position - originPosition).Magnitude <= radius then
				table.insert(result, player)
			end
		end
	end

	return result
end

--[=[
    Gets a player by a partial username match.

    @param username string -- The username or partial username
    @return Player? -- The matching player
]=]
function PlayerUtils.GetPlayerByPartialName(username: string): Player?
	username = username:lower()

	for _, player in Players:GetPlayers() do
		if player.Name:lower():sub(1, #username) == username then
			return player
		end
	end

	return nil
end

--[=[
    Gets a player's animator.

    @param player Player -- The player to get the animator from
    @return Animator? -- The player's animator
]=]
function PlayerUtils.GetAnimator(player: Player): Animator?
	local humanoid = PlayerUtils.GetHumanoid(player)

	if not humanoid then
		return nil
	end

	return humanoid:FindFirstChildWhichIsA("Animator")
end

--[=[
    Loads an animation onto a player's animator.

    @param player Player -- The player to load the animation onto
    @param animation Animation -- The animation to load
    @return AnimationTrack? -- The created animation track
]=]
function PlayerUtils.LoadAnimation(player: Player, animation: Animation): AnimationTrack?
	local Animator = PlayerUtils.GetAnimator(player)

	if not Animator then
		return nil
	end

	return Animator:LoadAnimation(animation)
end

--[=[
    Gets all tools a player currently owns.
    Searches both the character and backpack.

    @param player Player -- The player to get tools from
    @return {Tool} -- The player's tools
]=]
function PlayerUtils.GetTools(player: Player): { Tool }
	local tools = {}

	local function scan(container: Instance?)
		if not container then
			return
		end

		for _, child in InstanceUtils.GetChildrenOfClass(container, "Tool") do
			table.insert(tools, child)
		end
	end

	scan(player.Character)
	scan(player:FindFirstChildOfClass("Backpack"))

	return tools
end

--[=[
    Gets the currently equipped tool from a player's character.

    @param player Player -- The player to check
    @return Tool? -- The equipped tool
]=]
function PlayerUtils.GetEquippedTool(player: Player): Tool?
	local character = player.Character

	if not character then
		return nil
	end

	for _, child in character:GetChildren() do
		if child:IsA("Tool") then
			return child
		end
	end

	return nil
end

--[=[
    Gets the player's leaderstats folder.

    @param player Player -- The player to get leaderstats from
    @return Folder? -- The leaderstats folder
]=]
function PlayerUtils.GetLeaderstats(player: Player): Folder?
	local leaderstats = player:FindFirstChild("leaderstats")

	if leaderstats and leaderstats:IsA("Folder") then
		return leaderstats
	end

	return nil
end

--[=[
    Respawns a player instantly without playing the death animation.

    @param player Player -- The player to respawn
]=]
function PlayerUtils.Respawn(player: Player)
	local character = player.Character

	InstanceUtils.SafeDestroy(character)

	player:LoadCharacterAsync()
end

return PlayerUtils
