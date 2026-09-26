---@meta

---The type that represents an instance of a Server Signal which can be sent and received by Node Graphs. Contains functions for adding parameters and sending the signal.
---@class ServerSignal
local ServerSignal = {}

---Appends a Boolean to the Server Signal instance.
---@param value boolean  # The Boolean to append.
function ServerSignal:AddBool(value) end

---Appends a Boolean List to the Server Signal instance.
---@param values boolean[] # The sequence of Booleans to append.
function ServerSignal:AddBoolList(values) end

---Appends a Config ID to the Server Signal instance.
---
---Floating Point Numbers are evaluated as 0, and negative numbers underflow to their 32-bit unsigned integer equivalent.
---@param value number # The Config ID to append.
function ServerSignal:AddConfigId(value) end

---Appends a Config ID List to the Server Signal instance.
---- Floating Point Numbers in the sequence are evaluated as 0.
---- Negative numbers underflow to their 32-bit unsigned integer equivalent.
---- Throws an error if the table contains fields not in sequence, or values that are not numbers.
---@param values number[] # The sequence of Config IDs to append.
function ServerSignal:AddConfigIdList(values) end

---Appends an Entity to the Server Signal instance.
---- Floating Point Numbers are evaluated as 0.
---- Negative numbers underflow to their 32-bit unsigned integer equivalent.
---@param value number # The ID of the Entity to append.
function ServerSignal:AddEntity(value) end

---Appends an Entity List to the Server Signal instance.
---- Floating Point Numbers in the sequence are evaluated as 0.
---- Negative numbers underflow to their 32-bit unsigned integer equivalent.
---- Throws an error if the table contains fields not in sequence, or values that are not numbers.
---@param values number[] # The sequence of Entity IDs to append.
function ServerSignal:AddEntityList(values) end

---Appends a Floating Point Number to the Server Signal instance.
---@param value number # The Floating Point Number to append.
function ServerSignal:AddFloat(value) end

---Appends a Floating Point Number List parameter to the Server Signal instance.
---@param values number[] # The sequence of Floating Point Numbers to append.
function ServerSignal:AddFloatList(values) end

---Appends a GUID to the Server Signal instance.
---- Floating Point Numbers are evaluated as 0.
---- Negative numbers underflow to their 32-bit unsigned integer equivalent.
---@param value number # The GUID to append.
function ServerSignal:AddGuid(value) end

---Appends a GUID List to the Server Signal instance.
---- Floating Point Numbers in the sequence are evaluated as 0.
---- Negative numbers underflow to their 32-bit unsigned integer equivalent.
---- Throws an error if the table contains fields not in sequence, or values that are not numbers.
---@param values number[] # The sequence of GUIDs to append.
function ServerSignal:AddGuidList(values) end

---Appends an Integer parameter to the Server Signal instance. Floating Point Numbers are evaluated as 0.
---@param value number # The Integer to append.
function ServerSignal:AddInt(value) end

---Appends an Integer List parameter to the Server Signal instance.
---- Throws an error if the table contains fields not in sequence, or values that are not numbers.
---@param values number[] # The sequence of Integers to append. Floating Point Numbers in the sequence are evaluated as 0.
function ServerSignal:AddIntList(values) end

---Appends a parameter to the Server Signal instance.
---- Behavior for unexpected type values are documented in the add function for the corresponding type.
---
---**See:**
---- [Enum.ParamType](https://haminpants.github.io/mililua/class/Enum.ParamType.html) for all valid parameter types.
---@param type EnumItem.ParamType # The type that the parameter should be interpreted as.
---@param value ServerDataType # The value that should be sent for the added parameter.
function ServerSignal:AddParam(type, value) end

---Appends a Prefab ID to the Server Signal instance.
---- Floating Point Numbers are evaluated as 0.
---- Negative numbers underflow to their 32-bit unsigned integer equivalent.
---@param value number # The Prefab ID to append.
function ServerSignal:AddPrefabId(value) end

---Appends a Prefab ID List to the Server Signal instance.
---- Floating Point Numbers in the sequence are evaluated as 0.
---- Negative numbers underflow to their 32-bit unsigned integer equivalent.
---- Throws an error if the table contains fields not in sequence, or values that are not numbers.
---@param values number[] # The sequence of Prefab IDs to append.
function ServerSignal:AddPrefabIdList(values) end

---Appends a String to the Server Signal instance.
---@param value string # The String to append.
function ServerSignal:AddString(value) end

---Appends a String List to the Server Signal instance.
---@param values string[] # The sequence of Strings to append.
function ServerSignal:AddStringList(values) end

---Appends a 3D Vector to the Server Signal instance.
---@param value Vector3 # The 3D Vector to append.
function ServerSignal:AddVector3(value) end

---Appends a 3D Vector List to the Server Signal instance.
---@param values Vector3[] # The sequence of 3D Vectors to append.
function ServerSignal:AddVector3List(values) end

---Sends the signal.
---- Only Node Graphs will receive the signal, and the Signal Source Entity will always be the Stage Entity.
function ServerSignal:SendSignal() end
