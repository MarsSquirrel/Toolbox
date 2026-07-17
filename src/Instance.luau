--[=[
    @class InstanceUtils

    Helpful utility functions for Roblox Instances.
]=]
local InstanceUtils = {}

--> Type Declaration

--[=[
    @type PropertyTable { [string]: any }
    @within InstanceUtils
    A dictionary mapping property names as strings to their target values.
]=]
export type PropertyTable = { [string]: any }

--> Public Functions

--[=[
    Waits for a descendant matching a specific class.

    @param instance Instance -- The instance to search within
    @param className string -- The class name to search for
    @return Instance? -- The matching descendant
]=]
function InstanceUtils.WaitForDescendantOfClass(instance: Instance, className: string): Instance?
	local descendant = instance:FindFirstChildWhichIsA(className, true)

	if descendant then
		return descendant
	end

	while true do
		local added = instance.DescendantAdded:Wait()

		if added:IsA(className) then
			return added
		end
	end
end

--[=[
    Gets all direct children matching a specific class.

    @param instance Instance -- The instance to search within
    @param className string -- The class name to search for
    @return {Instance} -- A list of matching children
]=]
function InstanceUtils.GetChildrenOfClass(instance: Instance, className: string): { Instance }
	local result = {}

	for _, child in instance:GetChildren() do
		if child:IsA(className) then
			table.insert(result, child)
		end
	end

	return result
end

--[=[
    Gets all descendants matching a specific class.

    @param instance Instance -- The instance to search within
    @param className string -- The class name to search for
    @return {Instance} -- A list of matching descendants
]=]
function InstanceUtils.GetDescendantsOfClass(instance: Instance, className: string): { Instance }
	local result = {}

	for _, descendant in instance:GetDescendants() do
		if descendant:IsA(className) then
			table.insert(result, descendant)
		end
	end

	return result
end

--[=[
    Safely destroys an instance if it exists.

    @param instance Instance? -- The instance to destroy
]=]
function InstanceUtils.SafeDestroy(instance: Instance?)
	if instance then
		instance:Destroy()
	end
end

--[=[
    Assigns multiple properties to an instance.

    @param instance Instance -- The instance to modify
    @param properties PropertyTable -- A dictionary of properties and their values
]=]
function InstanceUtils.SetProperties(instance: Instance, properties: PropertyTable)
	for property, value in properties do
		pcall(function()
			(instance :: any)[property] = value
		end)
	end
end

--[=[
    Removes all descendants matching a specific class.

    @param instance Instance -- The instance to search within
    @param className string -- The class name to remove
]=]
function InstanceUtils.RemoveInstancesOfClass(instance: Instance, className: string)
	for _, descendant in instance:GetDescendants() do
		if descendant:IsA(className) then
			descendant:Destroy()
		end
	end
end

--[=[
    Removes all descendants matching a specific name.

    @param instance Instance -- The instance to search within
    @param name string -- The name of descendants to remove
]=]
function InstanceUtils.RemoveInstancesByName(instance: Instance, name: string)
	for _, descendant in instance:GetDescendants() do
		if descendant.Name == name then
			descendant:Destroy()
		end
	end
end

--[=[
    Counts all descendants of an instance.

    @param instance Instance -- The instance to count descendants of
    @return number -- The number of descendants
]=]
function InstanceUtils.CountDescendants(instance: Instance): number
	local count = 0

	for _ in instance:GetDescendants() do
		count += 1
	end

	return count
end

--[=[
    Counts all direct children of an instance.

    @param instance Instance -- The instance to count children of
    @return number -- The number of children
]=]
function InstanceUtils.CountChildren(instance: Instance): number
	return #instance:GetChildren()
end

--[=[
    Counts descendants matching a specific class.

    @param instance Instance -- The instance to search within
    @param className string -- The class name to count
    @return number -- The number of matching descendants
]=]
function InstanceUtils.CountDescendantsOfClass(instance: Instance, className: string): number
	local count = 0

	for _, descendant in instance:GetDescendants() do
		if descendant:IsA(className) then
			count += 1
		end
	end

	return count
end

--[=[
    Counts direct children matching a specific class.

    @param instance Instance -- The instance to search within
    @param className string -- The class name to count
    @return number -- The number of matching children
]=]
function InstanceUtils.CountChildrenOfClass(instance: Instance, className: string): number
	local count = 0

	for _, descendant in instance:GetChildren() do
		if descendant:IsA(className) then
			count += 1
		end
	end

	return count
end

return InstanceUtils
