---@meta

---The type that represents an instance of a Grid Scroller Control component. Contains functions for updating the grid and querying grid properties.
---
---The Grid Scroller Control component maintains an internal list of managed Client Controls, which cannot be accessed or modified.
---@class ClientUIGridScrollerControl : ClientUIBaseControl
---@field itemCount integer # [Read] The number of list items that were created in the most recent refresh.
---@field itemPrefabIndex integer # [Read/Write] The Client Control Template index used to create list items when RefreshItems is called.
---@field raycastTarget boolean # [Read/Write] Whether the Grid Scroller can be scrolled by dragging on empty space within its bounding box.
---@field showScrollBar boolean # [Read/Write] Whether to show the scrollbar.
---@field interactable boolean # [Read/Write] Whether the Grid Scroller can be scrolled by client input.
---@field scrollDirection EnumItem.ScrollDirection # [Read] The scroll direction.
---@field layoutConstraint EnumItem.ScrollLayoutConstraint # [Read] The list item layout constraint.
---@field layoutConstraintFixedCount number # [Read] The maximum list item count along the scroll direction. Always 0 when the layout constraint is set to Auto Wrap.
---@field scrollProgress NormalizedPercentage # [Read/Write/Tweenable] The normalized percentage representing the scroll position originating from the bottom-left corner. Values outside the range 0.0-1.0 may be returned during overscroll.
local ClientUIGridScrollerControl = {}

---Destroys all existing list item Client Controls, then instantiates the specified number of Client Controls as list items and invokes a callback for each item.
---- The corresponding lifecycle functions will be called for all affected Client Controls.
---
---**See:**
---- [OnDisable](https://haminpants.github.io/mililua/global/OnDisable.html)
---- [OnDestroy](https://haminpants.github.io/mililua/global/OnDestroy.html)
---- [OnInit](https://haminpants.github.io/mililua/global/OnInit.html)
---- [OnEnable](https://haminpants.github.io/mililua/global/OnEnable.html)
---- [OnStart](https://haminpants.github.io/mililua/global/OnStart.html)
---- [OnUpdate](https://haminpants.github.io/mililua/global/OnUpdate.html)
---- [OnLevelUpdate](https://haminpants.github.io/mililua/global/OnLevelUpdate.html)
---@param itemCount integer # The number of list item Client Controls to instantiate.
---@param callback fun(control: ClientControlType, index: integer) # The function invoked for each instantiated item, where `control` is the instantiated Client Control and `index` is its 0-indexed position in the Grid Scroller's internal list.
function ClientUIGridScrollerControl:RefreshItems(itemCount, callback) end

---Gets the 0-indexed position of the specified Client Control in the Grid Scroller's internal list.
---- Returns -1 if the specified Client Control is not in the Grid Scroller's internal list.
---@param control ClientControlType # The Client Control to get the index of.
---@return integer index # The 0-indexed position of the specified Client Control in the Grid Scroller's internal list.
function ClientUIGridScrollerControl:GetItemIndex(control) end

---Returns the list item dimensions.
---@return number width # The width of list items.
---@return number height # The height of list items.
function ClientUIGridScrollerControl:GetItemSize() end

---Returns the horizontal and vertical list item spacing.
---@return number horizontalSpacing # The horizontal spacing between list items.
---@return number verticalSpacing # The vertical spacing between list items.
function ClientUIGridScrollerControl:GetItemSpacing() end

---Returns the content area padding.
---@return number top # The padding from the top of the content area.
---@return number bottom # The padding from the bottom of the content area.
---@return number left # The padding from the left of the content area.
---@return number right # The padding from the right of the content area.
function ClientUIGridScrollerControl:GetPadding() end

---Instantly scrolls to the list item at the specified index.
---
---**See:**
---- [Enum.ScrollAlignType](https://haminpants.github.io/mililua/class/Enum.ScrollAlignType.html) for all scroll alignment types.
---@param index integer # The index of the list item to scroll to. Automatically clamped within the valid range of indices.
---@param scrollAlignType EnumItem.ScrollAlignType # The alignment type to determine where the specified list item should be when the scroll completes.
function ClientUIGridScrollerControl:ScrollToItemAt(index, scrollAlignType) end

---Returns the length of content along the scroll direction.
---
---Calculated using the following:
---```
---BaseLength = Direction Start Padding + Direction End Padding - Direction List Item Spacing
---ContentLength = BaseLength + (Direction Item Size + Direction List Item Spacing) * itemCount
---```
---For example, when the scroll direction is vertical, the top and bottom padding, vertical list item spacing, and list item height are used.
---@return number contentLength # The length of content along the scroll direction.
function ClientUIGridScrollerControl:GetContentLength() end
