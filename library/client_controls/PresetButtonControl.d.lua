---@meta

---The type that represents an instance of a Preset Button component. Contains functions for managing cursor event listeners.
---@class ClientUIPresetButtonControl : ClientUIBaseControl
---@field interactable boolean # [Read/Write] Whether the Preset Button responds to user input and triggers events.
---@field clickAudioId integer # [Read/Write] The ID of the sound effect to play when the button is clicked.
---@field raycastTarget boolean # [Read/Write] Whether the Preset Button can receive cursor interaction events.
local ClientUIPresetButtonControl = {}

---Registers a cursor event listener to the Client Control.
---
---**See:**
---- [Enum.CursorEventType](https://haminpants.github.io/mililua/class/Enum.CursorEventType.html) for all cursor event types.
---- [CursorEventData](https://haminpants.github.io/mililua/class/CursorEventData.html)
---@param eventType EnumItem.CursorEventType # The cursor event type to listen for.
---@param callback fun(eventData: CursorEventData) # The callback function, which exposes data about the cursor event.
function ClientUIPresetButtonControl:AddCursorEventListener(eventType, callback) end

---Removes the specified cursor event listener from the Client Control.
---
---**See:**
---- [Enum.CursorEventType](https://haminpants.github.io/mililua/class/Enum.CursorEventType.html) for all cursor event types.
---- [CursorEventData](https://haminpants.github.io/mililua/class/CursorEventData.html)
---@param eventType EnumItem.CursorEventType # The event type to remove the callback from.
---@param callback fun(eventData: CursorEventData) # The callback function to remove.
function ClientUIPresetButtonControl:RemoveCursorEventListener(eventType, callback) end

---Removes all cursor event listeners for the specified event type from the Client Control.
---
---**See:**
---- [Enum.CursorEventType](https://haminpants.github.io/mililua/class/Enum.CursorEventType.html) for all cursor event types.
---@param eventType EnumItem.CursorEventType # The event type to clear listeners from.
function ClientUIPresetButtonControl:RemoveCursorEventListeners(eventType) end

---Removes all cursor event listeners from the Client Control.
function ClientUIPresetButtonControl:RemoveAllCursorEventListeners() end

---Simulates the CursorDown, CursorUp, and CursorClick events in sequence.
function ClientUIPresetButtonControl:SimulateCursorClick() end
