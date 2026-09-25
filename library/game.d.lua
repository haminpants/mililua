---@meta

---A global table that contains functions for retrieving server state and client environment data, as well as managing client resources such as audio instances, Signals, and Tweens.
game = {}

---Destroys the specified Client Control instance.
---@param control ClientControlType # The Client Control to destroy.
function game.DestroyClientUIControl(control) end

---Gets a root-level ContainerControl by name. If multiple root-level ContainerControls with the same name exist, the first matching ContainerControl by runtime instantiation order will be returned.
---
---Root-level ContainerControls are instantiated in descending order from the list displayed in the editor's Interface Layout menu.
---
---When a root-level ContainerControl is added to the Client UI hierarchy by using the "Activate UI Control Group in Control Group Library" node on a Server Control Template containing a Client Container Control component, the created ContainerControl is appended to the Client UI hierarchy, regardless of the layer specified in its template.
---
---Returns nil if no matches are found.
---
---**See:**
---- [ClientUIBaseControl.name](https://haminpants.github.io/mililua/class/ClientUIBaseControl.html#ClientUIBaseControl.name)
---@param name string # The name of the Client Control to find.
---@return ClientUIContainerControl? control # The root-level ContainerControl with the specified name.
function game.FindClientUIRoot(name) end

---Gets a Client Control by runtime ID.
---
---Returns nil if no matches are found.
---
---**See:**
---- [ClientUIBaseControl.id](https://haminpants.github.io/mililua/class/ClientUIBaseControl.html#ClientUIBaseControl.id)
---@param id number # The runtime ID of the Client Control to find.
---@return ClientControlType? control # The Client Control with the corresponding runtime ID.
function game.GetClientUIControl(id) end

---Returns a sequence containing all active root-level ContainerControls.
---@return ClientUIContainerControl[] controls # The sequence of active root-level ContainerControls in the hierarchy.
function game.GetClientUIRoots() end

---Returns the Client Control currently focused by the controller.
---
---Returns nil if no Client Control is focused.
---@return ClientControlType? # The Client Control currently focused by the controller.
function game.GetControllerFocus() end

---Returns the left stick input values of the connected controller.
---
---Each axis returns a range within -1 (down/left) and 1 (up/right), with 0 representing no input.
---@return number horizontalInput # The horizontal axis input strength.
---@return number verticalInput # The vertical axis input strength.
function game.GetControllerLeftStickAxis() end

---Returns the right stick input values of the connected controller.
---
---Each axis returns a range within -1 (down/left) and 1 (up/right), with 0 representing no input.
---@return number horizontalInput # The horizontal axis input strength.
---@return number verticalInput # The vertical axis input strength.
function game.GetControllerRightStickAxis() end

---Returns the cursor position originating from the bottom-left corner of the viewport.
---@return number x # The cursor x position.
---@return number y # The cursor y position.
function game.GetCursorUIPos() end

---Returns the current input device type.
---
---**See:**
---- [Enum.Device](https://haminpants.github.io/mililua/class/Enum.Device.html) for all valid device types.
---@return EnumItem.Device device # The current device type.
function game.GetDevice() end

---Gets a declared Custom Variable from the specified entity.
---
---Returns nil if a Custom Variable with the provided name is not declared on the entity.
---
---**See:**
---- [Enum.CustomVariableEntityType](https://haminpants.github.io/mililua/class/Enum.CustomVariableEntityType.html) for all entities that Custom Variables can be retrieved from.
---@param entity EnumItem.CustomVariableEntityType # The entity to get the Custom Variable from.
---@param varName string # The name of the Custom Variable to get.
---@return ServerDataType? value # The value of the Custom Variable.
function game.GetGlobalCustomVariableValue(entity, varName) end

---Returns the language used by the client.
---
---**See:**
---- [Enum.LanguageType](https://haminpants.github.io/mililua/class/Enum.LanguageType.html) for all valid languages.
---@return EnumItem.LanguageType language # The current language.
function game.GetLanguageType() end

---Returns the current stage mode.
---
---**See:**
---- [Enum.StageMode](https://haminpants.github.io/mililua/class/Enum.StageMode.html) for all stage modes.
---@return EnumItem.StageMode # The stage mode.
function game.GetStageMode() end

---Returns the localized value of a Script Text Variable by Text Mapping ID.
---
---If a translation is not provided for the current language, text from the Source Language will be returned.
---
---Returns `textMappingId` if no Script Text Variable with the specified ID is found.
---@param textMappingId string # The ID of the Script Text Variable.
---@return string localizedText # The localized text.
function game.GetText(textMappingId) end

---Returns the width and height of the viewport.
---@return number width # The width of the viewport.
---@return number height # The height of the viewport.
function game.GetUICanvasSize() end

---Creates a new Client Control instance.
---
---The created Client Control is appended to the parent's list of children, assigning it the next largest sibling index.
---
---**See:**
---- [ClientUIBaseControl.SetSiblingIndex](https://haminpants.github.io/mililua/class/ClientUIBaseControl.html#ClientUIBaseControl.SetSiblingIndex) for detailed sibling-index behavior.
---@param templateIndex number # The index of the Client Control Template to create.
---@param parent ClientControlType # The Client Control which will be the parent of the created Client Control.
---@return ClientControlType # The created Client Control instance.
function game.InstantiateClientUIControl(templateIndex, parent) end

---Checks if the specified audio instance is currently active in memory.
---
---Returns false if an audio instance for the provided ID does not exist.
---@param audioInstanceId number # The ID of the audio instance to check the status of.
---@return boolean alive # Whether the audio instance for the given ID is alive.
function game.IsAudioAlive(audioInstanceId) end

---Returns whether level time is paused.
---@return boolean paused # Whether level time is paused.
function game.IsLevelTimePaused() end

---Checks if the client is currently running the stage in a test play.
---@return boolean testPlay # Whether the stage is being run as a test play.
function game.IsTestPlay() end

---Suspends or resumes level time.
---
---While paused, OnLevelUpdate lifecycle functions will not execute.
---
---Only takes effect in single-player stages.
---@param pause boolean # Whether to pause level time.
function game.PauseLevelTime(pause) end

---Creates a new audio instance playing the specified audio.
---@param id number # The ID of the audio clip to play.
---@return number audioInstanceId # The ID of the created audio instance.
function game.PlayAudio2D(id) end

---Prints all Client Controls in the hierarchy to the log.
function game.PrintClientUITree() end

---Creates a Server Signal instance for the specified signal name.
---@param signalName string # The name of the signal.
---@return ServerSignal signal # The Server Signal instance.
function game.ServerSignal(signalName) end

---Sets the controller focus to the specified control.
---@param control ClientControlType # The Client Control to focus.
function game.SetControllerFocus(control) end

---Stops the specified audio instance.
---@param audioInstanceId number # The ID of the audio instance to stop.
function game.StopAudio(audioInstanceId) end

---Creates a Tween instance targeting the given object. Once created, the target values can no longer be changed.
---@param object ClientControlType # The object to modify the fields of.
---@param targetValues TweenTarget # A table containing the target values of fields to modify during the Tween. A warning will be raised if a field in the table is not tweenable.
---@param duration number # The duration of the Tween in seconds.
---@return Tween tween # The created Tween instance.
function game.Tween(object, targetValues, duration) end

---Creates a new Tween Sequence.
---@return TweenSequence tweenSequence # The created Tween Sequence.
function game.TweenSequence() end
