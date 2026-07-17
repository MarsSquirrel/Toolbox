# Toolbox

A collection of reusable, type-safe Roblox Luau utility functions designed to simplify common development tasks.

Toolbox provides commonly needed helpers while keeping a clean and consistent API.

## Features

Toolbox includes utilities for:

- Instance management
- Player and character handling
- Tool management
- String manipulation
- Debugging and inspection

All functions are written in typed Luau and documented for automatic documentation generation using Moonwave.

## Installation

Install Toolbox using Wally:

```toml
[dependencies]
Toolbox = "marssquirrel/toolbox@^1.0.0"
```

## Usage

Toolbox exposes all utilities through a single flattened API.

```luau
local Toolbox = require(path.to.Toolbox)

local humanoid = Toolbox.GetHumanoid(player)

if humanoid then
	print(`{player.Name} has a humanoid yay.`)
end
```

Debugging example:

```luau
Toolbox.DumpPlayer(player)
```

String example:

```luau
local formatted = Toolbox.ToPascalCase("hello world")

print(formatted)
-- HelloWorld
```

## Contributing

Contributions are welcome and appreciated!

When adding new utilities:

* Keep functions type-safe.
* Add Moonwave documentation comments.
* Place utilities in the appropriate module.
* Avoid adding highly specific game logic.

Open a PR to submit a new function or utility.

## API

### Debug Utilities
`PrintTable`  
`PrintInstanceTree`  
`DumpPlayer`  

---

### Instance Utilities
`WaitForDescendantOfClass`  
`GetChildrenOfClass`  
`GetDescendantsOfClass`  
`SafeDestroy`  
`SetProperties`  
`RemoveInstancesOfClass`  
`RemoveInstancesByName`  
`CountDescendants`  
`CountChildren`  
`CountDescendantsOfClass`  
`CountChildrenOfClass`  

---

### Player Utilities
`WaitForCharacter`  
`GetHumanoid`  
`WaitForHumanoid`  
`GetRoot`  
`WaitForRoot`  
`IsAlive`  
`GetPosition`  
`GetDistance`  
`GetPlayersInRadius`  
`GetPlayerByPartialName`  
`GetAnimator`  
`LoadAnimation`  
`GetTools`  
`GetEquippedTool`  
`GetLeaderstats`  
`Respawn`  

---

### String Utilities
`Trim`  
`StartsWith`  
`EndsWith`  
`Contains`  
`Capitalize`  
`ToPascalCase`  
`ToCamelCase`  
`ToSnakeCase`  
`ToKebabCase`  
`RemoveWhitespace`  
`Shorten`  
`IsEmpty`  
`IsBlank`  
`PadLeft`  
`PadRight`