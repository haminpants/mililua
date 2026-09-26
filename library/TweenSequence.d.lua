---@meta

---The type that represents an instance of a Tween Sequence which can be used to play multiple Tweens in sequence or parallel. Contains functions for adding Tweens, delays, and callbacks to the Tween Sequence in a timeline-like style.
---
---Tweens in the sequence can target different Client Controls.
---
---### Tween Sequence Playback States:
---- Initial
---- Playing
---- Paused
---- Completed
---
---Regular Tween behaviors apply.
---@class TweenSequence
local TweenSequence = {}

---Appends a Tween to the end of the sequence and returns the current instance.
---- Tweens can only be appended if the Tween Sequence is in the Initial state.
---- If the added Tween is not in the Initial state, the Tween will not play its animation or call callbacks during the sequence.
---- Added Tweens should be in the Initial state and are considered to be in the Locked state after being added.
---@param tween Tween # The Tween to append to the sequence.
---@return TweenSequence # The current Tween Sequence instance.
function TweenSequence:Append(tween) end

---Appends a callback to the end of the sequence and returns the current instance.
---- Callbacks can only be appended if the Tween Sequence is in the Initial state.
---@param callback fun() # The function to call.
---@return TweenSequence # The current Tween Sequence instance.
function TweenSequence:AppendCallback(callback) end

---Appends a delay (in seconds) to the end of the sequence and returns the current instance.
---- Delays can only be appended if the Tween Sequence is in the Initial state.
---@param duration number # The wait duration in seconds.
---@return TweenSequence # The current Tween Sequence instance.
function TweenSequence:AppendInterval(duration) end

---Immediately completes Tween Sequence playback, moving the Tween Sequence to the Completed state.
---- The OnStepComplete and OnComplete callbacks of the Tween Sequence and all Tweens will be called.
function TweenSequence:Complete() end

---Inserts a Tween at a specific time and returns the current instance.
---- Tweens can only be inserted if the Tween Sequence is in the Initial state.
---@param time number # The time at which to insert the Tween.
---@param tween Tween # The Tween to insert.
---@return TweenSequence # The current Tween Sequence instance.
function TweenSequence:Insert(time, tween) end

---Inserts a callback at a specific time and returns the current instance.
---- Callbacks can only be inserted if the Tween Sequence is in the Initial state.
---@param time number # The time at which to insert the callback.
---@param callback fun() # The function to call.
---@return TweenSequence # The current Tween Sequence instance.
function TweenSequence:InsertCallback(time, callback) end

---Inserts a Tween at the same time as the current tailing Tween in the sequence and returns the current instance.
---- Tweens can only be joined if the Tween Sequence is in the Initial state.
---@param tween Tween # The Tween to insert.
---@return TweenSequence # The current Tween Sequence instance.
function TweenSequence:Join(tween) end

---Destroys the Tween Sequence.
---@param complete boolean # Whether to immediately complete Tween Sequence playback and call the OnStepComplete and OnComplete callbacks of the Tween Sequence and all Tweens.
function TweenSequence:Kill(complete) end

---Pauses sequence playback, moving the Tween Sequence to the Paused state.
---- Only takes effect if the Tween Sequence is in the Playing state.
---- Regular Tween behaviors apply according to the currently paused Tweens.
function TweenSequence:Pause() end

---Starts sequence playback, moving the Tween Sequence to the Playing state.
---- Only takes effect if the Tween Sequence is in the Initial state.
---- Regular Tween behaviors apply according to the currently playing Tweens.
---@return TweenSequence # The current Tween Sequence instance.
function TweenSequence:Play() end

---Restarts Tween Sequence playback, moving the Tween Sequence to the Playing state.
---- Only takes effect if the Tween Sequence is not in the Initial state.
---- The target values of all Tweens will be restored to their Initial state.
---- Regular Tween behaviors apply to all affected Tweens.
function TweenSequence:Restart() end

---Resumes sequence playback, moving the Tween Sequence to the Playing state.
---- Only takes effect if the Tween Sequence is in the Paused state.
---- Regular Tween behaviors apply according to the resumed Tweens.
function TweenSequence:Resume() end

---Sets the number of times the Tween Sequence will complete playback before moving to the Completed state and returns the current instance.
---@param loops number # The number of times to loop playback. The Tween Sequence will still play once if set to 0.
---@return TweenSequence # The current Tween Sequence instance.
function TweenSequence:SetLoops(loops) end

---Sets the OnComplete callback and returns the current instance.
---- Callbacks can only be set if the Tween Sequence is in the Initial state.
---- The OnComplete callback is called when all the events in the Tween Sequence have ended.
---@param onComplete fun() # The function to call when the Tween Sequence completes.
---@return TweenSequence # The current Tween Sequence instance.
function TweenSequence:SetOnComplete(onComplete) end

---Sets the OnStepComplete callback and returns the current instance.
---- Callbacks can only be set if the Tween Sequence is in the Initial state.
---- The OnStepComplete callback is called when the Tween Sequence loops or completes playback.
---@param onStepComplete fun() # The function to call when the Tween Sequence loops or completes playback.
---@return TweenSequence # The current Tween Sequence instance.
function TweenSequence:SetOnStepComplete(onStepComplete) end
