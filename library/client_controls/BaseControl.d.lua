---@meta

---The base type that represents the common fields and functions of all Client Controls. Contains functions for changing fields, setting state, and managing event listeners.
---
---Client Controls are destroyed and recreated whenever the client enters a loading screen, such as when teleporting or reconnecting.
---
---Pending Documentation:
---- Behavior of anchoredPositionX when anchorMinX is not equal to anchorMaxX
---- Behavior of anchoredPositionY when anchorMinY is not equal to anchorMaxY
---@class ClientUIBaseControl
---@field alive boolean # [Read] Whether the Client Control is instantiated.
---@field id number # [Read] The runtime ID of the Client Control.
---@field prefabIndex number # [Read] The template index of the Client Control.
---@field active boolean # [Read] Whether the Client Control is active. While active, attached scripts will call lifecycle functions.
---@field activeInHierarchy boolean # [Read] Whether the Client Control is active, factoring in the active states of its parent hierarchy.
---@field visible boolean # [Read] Whether the Client Control is visible.
---@field name string # [Read/Write] The name of the Client Control.
---@field parent ClientControlType? # [Read/Write] The parent of the Client Control. Always nil for root-level ControlContainers.
---@field anchoredPositionX number # [Read/Write/Tweenable] **(Pending Verification)** The x position of the Client Control's pivot point relative to its anchor point.
---@field anchoredPositionY number # [Read/Write/Tweenable] **(Pending Verification)** The y position of the Client Control's pivot point relative to its anchor point.
---@field sizeDeltaX number # [Read/Write/Tweenable] The size offset between the width of the Client Control and its x-axis anchor bounds.
---@field sizeDeltaY number # [Read/Write/Tweenable] The size offset between the height of the Client Control and its y-axis anchor bounds.
---@field anchorMinX NormalizedPercentage # [Read/Write/Tweenable] The minimum x anchor represented as a normalized percentage of the parent's width originating from the bottom-left corner of the parent's bounding box.
---@field anchorMinY NormalizedPercentage # [Read/Write/Tweenable] The minimum y anchor represented as a normalized percentage of the parent's height originating from the bottom-left corner of the parent's bounding box.
---@field anchorMaxX NormalizedPercentage # [Read/Write/Tweenable] The maximum x anchor represented as a normalized percentage of the parent's width originating from the bottom-left corner of the parent's bounding box.
---@field anchorMaxY NormalizedPercentage # [Read/Write/Tweenable] The maximum y anchor represented as a normalized percentage of the parent's height originating from the bottom-left corner of the parent's bounding box.
---@field pivotX DecimalPercentage # [Read/Write/Tweenable] The x position of the pivot point represented as a decimal percentage of the Client Control's width originating from the bottom-left corner of its bounding box.
---@field pivotY DecimalPercentage # [Read/Write/Tweenable] The y position of the pivot point represented as a decimal percentage of the Client Control's height originating from the bottom-left corner of its bounding box.
---@field localScaleX number # [Read/Write/Tweenable] The local x scale of the Client Control.
---@field localScaleY number # [Read/Write/Tweenable] The local y scale of the Client Control.
---@field localScaleZ number # [Read/Write/Tweenable] The local z scale of the Client Control.
---@field localRotationX number # [Read/Write/Tweenable] The local x rotation of the Client Control.
---@field localRotationY number # [Read/Write/Tweenable] The local y rotation of the Client Control.
---@field localRotationZ number # [Read/Write/Tweenable] The local z rotation of the Client Control.
---@field canControllerFocus boolean # [Read/Write] Whether the Client Control can be focused by controller navigation.
local ClientUIBaseControl = {}

---Registers a key event listener to the Client Control.
---
---The callback function must return a boolean which determines whether to mark the event as complete. If marked as complete, subsequent key event listeners of the same event type will be called, even if on a different root-level ContainerControl.
---
---**See:**
---- [Enum.KeyEventType](https://haminpants.github.io/mililua/class/Enum.KeyEventType.html) for all key event types.
---@param eventType EnumItem.KeyEventType # The key event type to listen for.
---@param callback fun(): boolean # The callback function, returning a boolean representing whether to mark the event as completed.
function ClientUIBaseControl:AddKeyEventListener(eventType, callback) end

---Registers a controller navigation event listener.
---
---**See:**
---- [Enum.ControllerNavigationEventType](https://haminpants.github.io/mililua/class/Enum.ControllerNavigationEventType.html) for all controller navigation event types.
---@param eventType EnumItem.ControllerNavigationEventType # The controller navigation type to listen for.
---@param callback fun() # The function to call when the event is triggered.
function ClientUIBaseControl:AddNavigationEventListener(eventType, callback) end

---Gets a child by path. If multiple children with the same path exist, the first by descending sibling index order is returned.
---
---Returns nil if there are no children with the specified path.
---
---Consider the following hierarchy:
---```
---Root
---└─ ChildA
---   ├─ ChildB
---   └─ ChildC
---```
---When called on Root to get ChildC, the path would be "ChildA/ChildC"
---@param path string # The path used to retrieve a child, using `/` as the delimiter.
---@return ClientControlType? # The first child with the specified path.
function ClientUIBaseControl:FindChild(path) end

---Returns the navigation mode and target for the specified direction.
---
---**See:**
---- [Enum.ControllerNavigationDir](https://haminpants.github.io/mililua/class/Enum.ControllerNavigationDir.html) for all controller navigation directions.
---- [Enum.ControllerNavigationMode](https://haminpants.github.io/mililua/class/Enum.ControllerNavigationMode.html) for all controller navigation modes.
---@param navigationDir EnumItem.ControllerNavigationDir # The direction to get navigation settings for.
---@return EnumItem.ControllerNavigationMode navigationMode # The navigation mode for the specified direction.
---@return ClientControlType? navigationTarget # The target Client Control. Only set for the Specified navigation mode.
function ClientUIBaseControl:GetControllerNavigation(navigationDir) end

---Returns the maximum anchors as a normalized percentage of the parent's size, originating from the bottom-left corner of the parent's bounding box.
---@return NormalizedPercentage x # The maximum x anchor.
---@return NormalizedPercentage y # The maximum y anchor.
function ClientUIBaseControl:GetAnchorMax() end

---Returns the minimum anchors as a normalized percentage of the parent's size, originating from the bottom-left corner of the parent's bounding box.
---@return NormalizedPercentage x # The minimum x anchor.
---@return NormalizedPercentage y # The minimum y anchor.
function ClientUIBaseControl:GetAnchorMin() end

---Returns the position of the pivot point relative to the anchor point.
---
---If anchorMin equals to anchorMax on a given axis, the anchor point for that axis resolves to anchorMin.
---
---Pending Documentation:
---- Behavior when anchorMin is not equal to anchorMax on a given axis.
---@return number x # The x-axis distance of the pivot point relative to the anchor point.
---@return number y # The y-axis distance of the pivot point relative to the anchor point.
function ClientUIBaseControl:GetAnchoredPosition() end

---Gets a child by name. If multiple children with the same name exist, the first by descending sibling index order is returned.
---
---Returns nil if there are no children with the specified name.
---@param name string # The name used to retrieve a child.
---@return ClientControlType? child # The first child with the specified name.
function ClientUIBaseControl:GetChild(name) end

---Returns the Client Control's children in descending sibling index order.
---@return ClientControlType[] # The sequence of children controls.
function ClientUIBaseControl:GetChildren() end

---Gets the local rotation of the Client Control.
---@return number x # The local x rotation of the Client Control.
---@return number y # The local y rotation of the Client Control.
---@return number z # The local z rotation of the Client Control.
function ClientUIBaseControl:GetLocalRotation() end

---Returns the local scale of the Client Control.
---@return number x # The local x scale of the Client Control.
---@return number y # The local y scale of the Client Control.
---@return number z # The local z scale of the Client Control.
function ClientUIBaseControl:GetLocalScale() end

---Returns the position of the Client Control's pivot as a decimal percentage of its dimensions originating from the bottom-left corner of its bounding box.
---@return DecimalPercentage x # The x position of the pivot as a decimal percentage of the Client Control's width.
---@return DecimalPercentage y # The y position of the pivot as a decimal percentage of the Client Control's height.
function ClientUIBaseControl:GetPivot() end

---Gets the instance of a script attached to the Client Control by Script Mapping ID.
---
---Returns nil if the script with the specified Script Mapping ID is not attached to the Client Control.
---@param scriptPrefabIndex number # The Script Mapping ID used to retrieve a script instance.
---@return Script? script # The script instance with the specified Script Mapping ID.
function ClientUIBaseControl:GetScript(scriptPrefabIndex) end

---Gets the instance of a script attached to the Client Control by file path, relative to the `external_lua_file` folder.
---
---Returns nil if the script with the specified file path is not attached to the Client Control.
---@param path string # The file path of the script, excluding the file extension.
---@return Script? script # The script instance with the specified path.
function ClientUIBaseControl:GetScriptByPath(path) end

---Returns a sequence of all scripts attached to the Client Control.
---@return Script[] scripts # The sequence of attached scripts.
function ClientUIBaseControl:GetScripts() end

---Returns the 0-indexed position of the Client Control in the parent's list of children.
---
---Returns -1 for root-level ContainerControls.
---
---**See:**
---- [ClientUIBaseControl.SetSiblingIndex](https://haminpants.github.io/mililua/class/ClientUIBaseControl.html#ClientUIBaseControl.SetSiblingIndex) for detailed sibling-index behavior.
---@return number index # The 0-indexed position of the Client Control in the parent's list of children.
function ClientUIBaseControl:GetSiblingIndex() end

---Returns the difference in size between the Client Control and the distance between its minimum and maximum anchors.
---
---If anchorMin equals to anchorMax on a given axis, the delta for that axis represents the Client Control's size along that axis.
---@return number deltaX # The size offset between the width of the Client Control and its x-axis anchor bounds.
---@return number deltaY # The size offset between the height of the Control and its y-axis anchor bounds.
function ClientUIBaseControl:GetSizeDelta() end

---Removes all key event listeners from the Client Control.
function ClientUIBaseControl:RemoveAllKeyEventListeners() end

---Removes all controller navigation event listeners from the Client Control.
function ClientUIBaseControl:RemoveAllNavigationEventListeners() end

---Removes the specified key event listener from the Client Control.
---
---**See:**
---- [Enum.KeyEventType](https://haminpants.github.io/mililua/class/Enum.KeyEventType.html) for all key event types.
---@param eventType EnumItem.KeyEventType # The event type to remove the callback from.
---@param callback fun(): boolean # The callback function to remove.
function ClientUIBaseControl:RemoveKeyEventListener(eventType, callback) end

---Removes all key event listeners for the specified event type from the Client Control.
---
---**See:**
---- [Enum.KeyEventType](https://haminpants.github.io/mililua/class/Enum.KeyEventType.html) for all key event types.
---@param eventType EnumItem.KeyEventType # The event type to clear listeners from.
function ClientUIBaseControl:RemoveKeyEventListeners(eventType) end

---Removes the specified controller navigation event listener from the Client Control.
---
---**See:**
---- [Enum.ControllerNavigationEventType](https://haminpants.github.io/mililua/class/Enum.ControllerNavigationEventType.html) for all controller navigation event types.
---@param eventType EnumItem.ControllerNavigationEventType # The event type to remove the callback from.
---@param callback fun() # The callback function to remove.
function ClientUIBaseControl:RemoveNavigationEventListener(eventType, callback) end

---Removes all listeners for the specified event type from the Client Control.
---
---**See:**
---- [Enum.ControllerNavigationEventType](https://haminpants.github.io/mililua/class/Enum.ControllerNavigationEventType.html) for all controller navigation event types.
---@param eventType EnumItem.ControllerNavigationEventType # The event type to clear listeners from.
function ClientUIBaseControl:RemoveNavigationEventListeners(eventType) end

---Sets the active status of the Client Control.
---
---If the active status is changed, the corresponding lifecycle functions are called (OnEnable when true and OnDisable when false).
---@param active boolean # Whether to set as active.
function ClientUIBaseControl:SetActive(active) end

---Sets the maximum anchors as a normalized percentage of the size of the parent, originating from the bottom-left corner of the parent's bounding box.
---@param x NormalizedPercentage # The maximum x anchor.
---@param y NormalizedPercentage # The maximum y anchor.
function ClientUIBaseControl:SetAnchorMax(x, y) end

---Sets the minimum anchors as a normalized percentage of the size of the parent, originating from the bottom-left corner of the parent's bounding box.
---@param x NormalizedPercentage # The minimum x anchor.
---@param y NormalizedPercentage # The minimum y anchor.
function ClientUIBaseControl:SetAnchorMin(x, y) end

---Sets the position of the pivot point relative to the anchor point.
---
---If anchorMin equals to anchorMax on a given axis, the anchor point for that axis resolves to anchorMin.
---
---Pending Documentation:
---- Behavior when anchorMin is not equal to anchorMax on a given axis.
---@param x number # The x position of the pivot point relative to the anchor point.
---@param y number # The y position of the pivot point relative to the anchor point.
function ClientUIBaseControl:SetAnchoredPosition(x, y) end

---Sets the Client Control as the first child (index 0) of its parent.
---
---**See:**
---- [ClientUIBaseControl.SetSiblingIndex](https://haminpants.github.io/mililua/class/ClientUIBaseControl.html#ClientUIBaseControl.SetSiblingIndex) for detailed sibling-index behavior.
---
---Pending Documentation:
---- Unknown return value, seems to always return true.
---@return boolean unknown # ?
function ClientUIBaseControl:SetAsFirstSibling() end

---Sets the Client Control as the last child (greatest index) of its parent.
---
---**See:**
---- [ClientUIBaseControl.SetSiblingIndex](https://haminpants.github.io/mililua/class/ClientUIBaseControl.html#ClientUIBaseControl.SetSiblingIndex) for detailed sibling-index behavior.
---
---Pending Documentation:
---- Unknown return value, seems to always return true.
---@return boolean unknown # ?
function ClientUIBaseControl:SetAsLastSibling() end

---Sets the controller navigation mode for a specific navigation direction.
---
---If Enum.ControllerNavigationMode.Specified is passed and the navigation target is nil, the navigation mode will be set to None.
---
---**See:**
---- [Enum.ControllerNavigationDir](https://haminpants.github.io/mililua/class/Enum.ControllerNavigationDir.html) for all controller navigation directions.
---- [Enum.ControllerNavigationMode](https://haminpants.github.io/mililua/class/Enum.ControllerNavigationMode.html) for all controller navigation modes.
---@param navigationDir EnumItem.ControllerNavigationDir # The navigation direction to apply the navigation mode to.
---@param navigationMode EnumItem.ControllerNavigationMode # The navigation mode to use.
---@param navigationTarget? ClientControlType # The navigation target. Required if the Specified navigation mode is passed, otherwise this parameter is ignored.
function ClientUIBaseControl:SetControllerNavigation(navigationDir, navigationMode, navigationTarget) end

---Sets the local rotation of the Client Control.
---@param x number # The local x rotation of the Client Control.
---@param y number # The local y rotation of the Client Control.
---@param z number # The local z rotation of the Client Control.
function ClientUIBaseControl:SetLocalRotation(x, y, z) end

---Sets the local scale of the Client Control.
---@param x number # The local x scale of the Client Control.
---@param y number # The local y scale of the Client Control.
---@param z number # The local z scale of the Client Control.
function ClientUIBaseControl:SetLocalScale(x, y, z) end

---Sets the position of the Client Control's pivot as a decimal percentage of its dimensions originating from the bottom-left corner of its bounding box.
---@param x DecimalPercentage # The x position of the pivot as a decimal percentage of the width.
---@param y DecimalPercentage # The y position of the pivot as a decimal percentage of the height.
function ClientUIBaseControl:SetPivot(x, y) end

---Sets the 0-indexed position of the Client Control in the parent's list of children.
---
---Higher-index siblings are rendered on top of lower-index siblings, meaning children are listed in descending sibling order in the editor.
---
---Pending Documentation:
---- Unknown return value, seems to always return true.
---@param index integer # The 0-indexed position in the parent's list of children. Automatically clamped within the valid range of indexes.
---@return boolean # ?
function ClientUIBaseControl:SetSiblingIndex(index) end

---Sets the size offset between the Client Control and the its anchor bounds.
---
---If anchorMin equals to anchorMax on a given axis, the delta for that axis represents the Client Control's size along that axis.
---@param deltaX number # The size offset between the Client Control's width and x-axis anchor bounds.
---@param deltaY number # The size offset between the Client Control's height and y-axis anchor bounds.
function ClientUIBaseControl:SetSizeDelta(deltaX, deltaY) end

---Sets the visibility status of the Client Control.
---@param visible boolean # Whether to set as visible.
function ClientUIBaseControl:SetVisible(visible) end
