---@meta

---The type that represents an instance of a CursorEventArea component. Contains functions for managing cursor event listeners.
---@class ClientUICursorEventAreaControl : ClientUIBaseControl
---@field raycastTarget boolean # [Read/Write] Whether the Cursor Event Area can receive cursor interaction events.
local ClientUICursorEventAreaControl = {}

---Registers a cursor event listener to the Client Control.
---
---**See:**
---- [Enum.CursorEventType](https://haminpants.github.io/mililua/class/Enum.CursorEventType.html) for all cursor event types.
---- [CursorEventData](https://haminpants.github.io/mililua/class/CursorEventData.html)
---@param eventType EnumItem.CursorEventType # The cursor event type to listen for.
---@param callback fun(eventData: CursorEventData) # The callback function, which exposes data about the cursor event.
function ClientUICursorEventAreaControl:AddCursorEventListener(eventType, callback) end

---Removes the specified cursor event listener from the Client Control.
---
---**See:**
---- [Enum.CursorEventType](https://haminpants.github.io/mililua/class/Enum.CursorEventType.html) for all cursor event types.
---- [CursorEventData](https://haminpants.github.io/mililua/class/CursorEventData.html)
---@param eventType EnumItem.CursorEventType # The event type to remove the callback from.
---@param callback fun(eventData: CursorEventData) # The callback function to remove.
function ClientUICursorEventAreaControl:RemoveCursorEventListener(eventType, callback) end

---Removes all cursor event listeners for the specified event type from the Client Control.
---
---**See:**
---- [Enum.CursorEventType](https://haminpants.github.io/mililua/class/Enum.CursorEventType.html) for all cursor event types.
---@param eventType EnumItem.CursorEventType # The event type to clear listeners from.
function ClientUICursorEventAreaControl:RemoveCursorEventListeners(eventType) end

---Removes all cursor event listeners from the Client Control.
function ClientUICursorEventAreaControl:RemoveAllCursorEventListeners() end

---Simulates the CursorDown, CursorUp, and CursorClick events in sequence.
function ClientUICursorEventAreaControl:SimulateCursorClick() end
