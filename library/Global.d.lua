---@meta

---Returns the runtime type name of the specified value.
---@param value any
---@return ApiType typeName
function typeof(value) end

---Writes passed values to the log.
---- Client Script logging must be enabled.
function print(...) end

---Writes passed values to the log as an error.
---- Client Script logging must be enabled.
---- Does not block execution.
function printerr(...) end

---Creates a color from 0-255 RGBA.
---@param r number # The red component (0-255).
---@param g number # The green component (0-255).
---@param b number # The blue component (0-255).
---@param a? number # (Optional) The alpha component (0-255, default 255).
---@return ColorValue
function Color(r, g, b, a) end

---Called immediately when the Client Control that the script is attached to is initialized.
---- Ignored by Module scripts.
---
---### Stage Start Lifecycle Function Call Order
---1. **Top Level Code > OnInit - Global Script**
---2. **Top Level Code > OnInit - Client Control Hierarchy**
---3. OnEnable - Client Control Hierarchy
---4. OnStart - Client Control Hierarchy
---5. OnEnable - Global Script
---6. OnStart - Global Script
---7. OnUpdate > OnLevelUpdate - Global Script
---8. OnUpdate > OnLevelUpdate - Client Control Hierarchy
---9. OnDestroy - Global Script (On Stage End)
function OnInit() end

---Called when the active state of the Client Control that the script is attached to changes to true.
---- Also called after OnInit for initally active Client Controls that have been pre-placed in the Client Control Container.
---- Ignored by Module scripts.
---
---### Stage Start Lifecycle Function Call Order
---1. Top Level Code > OnInit - Global Script
---2. Top Level Code > OnInit - Client Control Hierarchy
---3. **OnEnable - Client Control Hierarchy**
---4. OnStart - Client Control Hierarchy
---5. **OnEnable - Global Script**
---6. OnStart - Global Script
---7. OnUpdate > OnLevelUpdate - Global Script
---8. OnUpdate > OnLevelUpdate - Client Control Hierarchy
---9. OnDestroy - Global Script (On Stage End)
function OnEnable() end

---Called after the first time the Client Control's OnEnable callback is called.
---- Ignored by Module scripts.
---
---### Stage Start Lifecycle Function Call Order
---1. Top Level Code > OnInit - Global Script
---2. Top Level Code > OnInit - Client Control Hierarchy
---3. OnEnable - Client Control Hierarchy
---4. **OnStart - Client Control Hierarchy**
---5. OnEnable - Global Script
---6. **OnStart - Global Script**
---7. OnUpdate > OnLevelUpdate - Global Script
---8. OnUpdate > OnLevelUpdate - Client Control Hierarchy
---9. OnDestroy - Global Script (On Stage End)
function OnStart() end

---Called when the active state of the Client Control that the script is attached to changes to false.
---- Also called before OnDestroy when the Client Control the script is attached to is destroyed.
---- Ignored by Module scripts.
function OnDisable() end

---Called when the Client Control that the script is attached to is destroyed.
---- Also called by the Global Script when the stage ends; however, there is no guarantee that the function will execute before the client disconnects.
---- Ignored by Module scripts.
function OnDestroy() end

---Called once every frame.
---- Updates must be enabled for the script for this lifecycle function to be called.
---- Ignored by Module scripts.
---
---### Stage Start Lifecycle Function Call Order
---1. Top Level Code > OnInit - Global Script
---2. Top Level Code > OnInit - Client Control Hierarchy
---3. OnEnable - Client Control Hierarchy
---4. OnStart - Client Control Hierarchy
---5. OnEnable - Global Script
---6. OnStart - Global Script
---7. **OnUpdate > OnLevelUpdate - Global Script**
---8. **OnUpdate > OnLevelUpdate - Client Control Hierarchy**
---9. OnDestroy - Global Script (On Stage End)
---@param deltaTime number # The time elapsed since the last frame in seconds.
function OnUpdate(deltaTime) end

---Called once after OnUpdate every frame when level-time is not paused.
---- Updates must be enabled for the script for this lifecycle function to be called.
---- Ignored by Module scripts.
---
---### Stage Start Lifecycle Function Call Order
---1. Top Level Code > OnInit - Global Script
---2. Top Level Code > OnInit - Client Control Hierarchy
---3. OnEnable - Client Control Hierarchy
---4. OnStart - Client Control Hierarchy
---5. OnEnable - Global Script
---6. OnStart - Global Script
---7. **OnUpdate > OnLevelUpdate - Global Script**
---8. **OnUpdate > OnLevelUpdate - Client Control Hierarchy**
---9. OnDestroy - Global Script (On Stage End)
---@param levelDeltaTime number # The time elapsed since the last frame in seconds.
function OnLevelUpdate(levelDeltaTime) end
