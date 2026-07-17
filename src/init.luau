--[[
	File: init.luau
	Author: MarsSquirrel
	Created: 07/17/2026
	Description: Bundles all Toolbox functions.
]]

--> Dependencies

local InstanceUtils = require(script.Instance)
local PlayerUtils = require(script.Player)
local StringUtils = require(script.String)
local DebugUtils = require(script.Debug)

--> Module Initialization

local Toolbox = {}

--> Instance Commands

Toolbox.WaitForDescendantOfClass = InstanceUtils.WaitForDescendantOfClass
Toolbox.GetChildrenOfClass = InstanceUtils.GetChildrenOfClass
Toolbox.GetDescendantsOfClass = InstanceUtils.GetDescendantsOfClass
Toolbox.SafeDestroy = InstanceUtils.SafeDestroy
Toolbox.SetProperties = InstanceUtils.SetProperties
Toolbox.RemoveInstancesOfClass = InstanceUtils.RemoveInstancesOfClass
Toolbox.RemoveInstancesByName = InstanceUtils.RemoveInstancesByName
Toolbox.CountDescendants = InstanceUtils.CountDescendants
Toolbox.CountChildren = InstanceUtils.CountChildren
Toolbox.CountDescendantsOfClass = InstanceUtils.CountDescendantsOfClass
Toolbox.CountChildrenOfClass = InstanceUtils.CountChildrenOfClass

--> Player Commands

Toolbox.WaitForCharacter = PlayerUtils.WaitForCharacter
Toolbox.GetHumanoid = PlayerUtils.GetHumanoid
Toolbox.WaitForHumanoid = PlayerUtils.WaitForHumanoid
Toolbox.GetRoot = PlayerUtils.GetRoot
Toolbox.WaitForRoot = PlayerUtils.WaitForRoot
Toolbox.IsAlive = PlayerUtils.IsAlive
Toolbox.GetPosition = PlayerUtils.GetPosition
Toolbox.GetDistance = PlayerUtils.GetDistance
Toolbox.GetPlayersInRadius = PlayerUtils.GetPlayersInRadius
Toolbox.GetPlayerByPartialName = PlayerUtils.GetPlayerByPartialName
Toolbox.GetAnimator = PlayerUtils.GetAnimator
Toolbox.LoadAnimation = PlayerUtils.LoadAnimation
Toolbox.GetTools = PlayerUtils.GetTools
Toolbox.GetEquippedTool = PlayerUtils.GetEquippedTool
Toolbox.GetLeaderstats = PlayerUtils.GetLeaderstats
Toolbox.Respawn = PlayerUtils.Respawn

--> String Commands

Toolbox.Trim = StringUtils.Trim
Toolbox.StartsWith = StringUtils.StartsWith
Toolbox.EndsWith = StringUtils.EndsWith
Toolbox.Contains = StringUtils.Contains
Toolbox.Capitalize = StringUtils.Capitalize
Toolbox.ToPascalCase = StringUtils.ToPascalCase
Toolbox.ToCamelCase = StringUtils.ToCamelCase
Toolbox.ToSnakeCase = StringUtils.ToSnakeCase
Toolbox.ToKebabCase = StringUtils.ToKebabCase
Toolbox.RemoveWhitespace = StringUtils.RemoveWhitespace
Toolbox.Shorten = StringUtils.Shorten
Toolbox.IsEmpty = StringUtils.IsEmpty
Toolbox.IsBlank = StringUtils.IsBlank
Toolbox.PadLeft = StringUtils.PadLeft
Toolbox.PadRight = StringUtils.PadRight

--> Debug Commands

Toolbox.PrintTable = DebugUtils.PrintTable
Toolbox.PrintInstanceTree = DebugUtils.PrintInstanceTree
Toolbox.DumpPlayer = DebugUtils.DumpPlayer

return Toolbox
