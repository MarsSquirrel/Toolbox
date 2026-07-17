---
sidebar_position: 3
---

# Examples

Toolbox provides a collection of simple utilities designed to reduce repetitive code when developing Roblox experiences.

## Getting Started

Require Toolbox in your script:

```luau
local Toolbox = require(path.Toolbox)
```

All utilities are available directly from the Toolbox module.

## Finding Instances

Instead of manually looping through descendants, use the built-in instance utilities:

```luau
local button = Toolbox.WaitForDescendantOfClass(screenGui, "TextButton")

button.Text = "Clicked!"
```

You can also retrieve multiple instances:

```luau
local buttons = Toolbox.GetDescendantsOfClass(screenGui, "TextButton")

for _, button in buttons do
	print(button.Name)
end
```

## Working With Players

Get common player objects without repeatedly checking for characters:

```luau
local humanoid = Toolbox.GetHumanoid(player)
local root = Toolbox.GetRoot(player)

if humanoid then
	print(`Health: {humanoid.Health}`)
end
```

Check player status:

```luau
if Toolbox.IsAlive(player) then
	print("Player is alive")
end
```

## String Formatting

Convert strings into different formats:

```luau
local pascal = Toolbox.ToPascalCase("hello world")
local camel = Toolbox.ToCamelCase("hello world")
local snake = Toolbox.ToSnakeCase("hello world")

print(pascal)
-- HelloWorld

print(camel)
-- helloWorld

print(snake)
-- hello_world
```

## Debugging

Inspect a player:

```luau
Toolbox.DumpPlayer(player)
```

Print an instance hierarchy:

```luau
Toolbox.PrintInstanceTree(workspace)
```

Print a table recursively:

```luau
Toolbox.PrintTable({
	Score = 100,
	Stats = {
		Level = 5
	}
})
```

## Cleaning Up Instances

```luau
Toolbox.SafeDestroy(part)
```

Remove all instances of a specific class:

```luau
Toolbox.RemoveInstancesOfClass(workspace, "ParticleEmitter")
```

## Recommended Usage

Toolbox is designed to handle common development patterns while keeping your own game code focused on gameplay logic.

Use Toolbox for repetitive tasks, but keep game-specific behavior inside your own systems and modules.