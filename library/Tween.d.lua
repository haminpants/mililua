---@meta

---The type that represents an instance of a Tween which can be used to animate Client Controls. Contains functions for changing the Tween's behavior and playback state.
---
---### Tween Playback States:
---- Initial
---- Playing
---- Paused
---- Completed
---- Locked
---
---While in the Playing state, fields being tweened cannot be changed.
---
---Attempting to tween the same field from multiple Tweens on the same Client Control will cause different behaviors depending on the state and behavior that the currently playing Tween is in.
---@class Tween
local Tween = {}

---Immediately completes Tween playback and calls the OnStepComplete and OnComplete callbacks.
function Tween:Complete() end

---Destroys the Tween.
---@param complete boolean # Whether to immediately complete Tween playback and invoke the OnStepComplete and OnComplete callbacks.
function Tween:Kill(complete) end

---Pauses Tween playback, moving the Tween to the Paused state.
---
---Manual modifications made to tweened fields while paused will be overriden by the Tween's calculated values upon resuming.
---
---Only takes effect if the Tween is in the Playing state.
function Tween:Pause() end

---Starts Tween playback, moving the Tween to the Playing state, and returns the current instance.
---
---While in the Playing state, fields being tweened cannot be changed.
---
---Only takes effect if the Tween is in the Initial state.
---@return Tween # The current Tween instance.
function Tween:Play() end

---Resets the tweened fields to their initial values and begins playback from the start.
---
---Only takes effect if the Tween is not in the Initial state.
function Tween:Restart() end

---Resumes Tween playback, moving the Tween to the Playing state.
---
---Manual modifications made to tweened fields while paused will be overriden by the Tween's calculated values upon resuming.
---
---Only takes effect if the Tween is in the Paused state.
function Tween:Resume() end

---Sets the easing function of the Tween and returns the current instance.
---
---Only takes effect if the Tween is in the Initial state.
---
---**See:**
---- [Enum.EaseType](https://haminpants.github.io/mililua/class/Enum.EaseType.html) for all ease types.
---- [Interactive Easing Simulator](https://interverse.github.io/easelab/) to visualize the effect of each ease type.
---@param easeType EnumItem.EaseType # The easing function to animate fields with.
---@return Tween # The current Tween instance.
function Tween:SetEase(easeType) end

---Sets the number of times the Tween will complete playback before moving to the Completed state and returns the current instance.
---
---The Tween will always play at least once; a negative value will cause the Tween to loop indefinitely.
---
---Only takes effect if the Tween is in the Initial state.
---@param loops number # The number of times to loop playback.
---@return Tween # The current Tween instance.
function Tween:SetLoops(loops) end

---Sets the OnComplete callback and returns current instance.
---
---The OnComplete callback is called when Tween playback completes.
---
---Only takes effect if the Tween is in the Initial state.
---@param callback fun() # The function to call when the Tween completes.
---@return Tween # The current Tween instance.
function Tween:SetOnComplete(callback) end

---Sets the OnStepComplete callback and returns current instance.
---
---The OnStepComplete callback is called when the Tween loops or completes playback.
---
---Only takes effect if the Tween is in the Initial state.
---@param callback fun() # The function to call when the Tween loops or completes playback.
---@return Tween # The current Tween instance.
function Tween:SetOnStepComplete(callback) end

---Sets how the target values are interpreted during the tween and returns the current instance.
---
---When tweening relatively:
---- Target values are interpreted as being added to the values stored in the Initial state.
---- Only number fields will be applied. Color fields will not take effect.
---
---Only takes effect if the Tween is in the Initial state.
---@param relative boolean # Whether to interpret target values relative to the values stored in the Initial state.
---@return Tween # The current Tween instance.
function Tween:SetRelative(relative) end
