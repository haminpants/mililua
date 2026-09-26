---@meta

---@type Script
script = script

---The type that represents an instance of a script that is attached to a Client Control, set as the Global Script, or running as a Module.
---@class Script
---@field alive boolean # [Read] Whether the script instance is currently loaded. Check this field before calling user-defined global functions from a different script.
---@field id number # [Read] The runtime ID of the script instance.
---@field prefabIndex number? # [Read] The mapping ID of the script. Always nil for Modules.
---@field object ClientControlType? # [Read] The Client Control instance that the script is mounted on. Always nil for the Global Script and Modules.
---@field path string # [Read] The path of the script relative to the `external_lua_file` directory, without the file extension.
---@field enabled boolean # [Read/Write] The active execution state of the script. **Not observed to have any effect on lifecycle functions or event handlers when changed directly.**
local Script = {}

---Sets whether the script executes OnUpdate and OnLevelUpdate lifecycle functions.
---
---**See:**
---- [OnUpdate](https://haminpants.github.io/mililua/global/OnUpdate.html)
---- [OnLevelUpdate](https://haminpants.github.io/mililua/global/OnLevelUpdate.html)
---@param enabled boolean # Whether to execute OnUpdate and OnLevelUpdate lifecycle functions.
function Script:EnableUpdate(enabled) end

---Gets the value of a Script Variable defined in the script's mapping by name.
---
---Returns nil if a Script Variable with the specified name does not exist.
---@generic T : ServerDataType
---@param varName string # The name of the Script Variable.
---@return T? # The value of the Script Variable.
function Script:GetParam(varName) end

---Calls a global function by name.
---
---If calling a global function from another script instance, it is recommended to check that the target script is alive.
---
---**See:**
---- [Script.alive](https://haminpants.github.io/mililua/class/Script.html#Script.alive)
---@param funcName string # The name of the function to call (case-sensitive).
---@param ... any # Parameters to pass to the function call.
---@return any ... # The return values of the called function.
function Script:Invoke(funcName, ...) end

---Registers a Custom Variable changed handler for the specified variable name and entity. The callback function does not provide pre-change or post-change values.
---
---Multiple handlers for the same Custom Variable cannot be registered on the same script; only the earliest handler will take effect.
---
---**See:**
---- [Enum.CustomVariableEntityType](https://haminpants.github.io/mililua/class/Enum.CustomVariableEntityType.html) for all entities that Custom Variables changes can be handled on.
---- [game.GetGlobalCustomVariableValue](https://haminpants.github.io/mililua/global/game.html#game.GetGlobalCustomVariableValue)
---@param entity EnumItem.CustomVariableEntityType # The entity to handle Custom Variable changes on.
---@param varName string # The name of the Custom Variable.
---@param callback fun(entity: EnumItem.CustomVariableEntityType, varName: string) # The callback to execute whenever the specified Custom Variable changes.
function Script:RegisterCustomVariableChangedHandler(entity, varName, callback) end

---Registers a Client Scripted Signal handler for the specified signal name.
---- Multiple handlers for the same signal cannot be registered on the same script; only the earliest handler will take effect.
---- Only signals sent using the Send Client Scripted Signal server node will be handled, and **all server-sent signals have a minimum latency of approximately 100ms.**
---- Callback parameters can only be accessed by sequence index, matching the order in the Server Signal Explorer.
---
---To get typed signal parameters, create a class using [LuaLS annotations](https://luals.github.io/wiki/annotations/#class) with the same name as your signal. See below:
---```lua
------@class MySignal
------@field [1] string
------@field [2] integer
------@field [3] Vector3[]
---
---script:RegisterServerSignalHandler("MySignal", function(signalName, signalParams)
---    local myString = signalParams[1] -- Now typed as a string
---    local myInt = signalParams[2] -- Now typed as an integer
---    local myVec3List = signalParams[3] -- Now typed as a 3D Vector list
---end)
---```
---@generic T : ServerDataType[]
---@param signalName `T` # The name of the signal to register a handler for.
---@param callback fun(signalName: string, signalParams: T|GenericServerSignal) # The callback to execute whenever the signal is received.
function Script:RegisterServerSignalHandler(signalName, callback) end

---Removes the handler for the specified Custom Variable.
---
---**See:**
---- [Enum.CustomVariableEntityType](https://haminpants.github.io/mililua/class/Enum.CustomVariableEntityType.html) for all entities that Custom Variable changes can be handled on.
---@param entity EnumItem.CustomVariableEntityType # The entity to unregister the handler from.
---@param varName string # The name of the Custom Variable.
function Script:UnregisterCustomVariableChangedHandler(entity, varName) end

---Removes the handler for the specified Client Scripted Signal.
---@param signalName string # The name of the signal to unregister the active handler for.
function Script:UnregisterServerSignalHandler(signalName) end
