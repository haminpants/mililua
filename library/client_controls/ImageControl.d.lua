---@meta

---The type that represents an instance of an Image Control component. Contains functions for manipulating the image source and fill type.
---@class ClientUIImageControl : ClientUIBaseControl
---@field imageSource EnumItem.ImageSource # [Read] The image source type.
---@field imageId integer # [Read] The image asset ID.
---@field imageColor ColorValue # [Read/Write/Tweenable] The color of the image.
---@field imageType EnumItem.ImageType # [Read/Write] The image type.
---@field enableMask boolean # [Read/Write] Whether masking is enabled.
---@field enableSoftEdge boolean # [Read/Write] Whether soft edge is enabled.
---@field softEdgeMode EnumItem.ImageMaskSoftEdgeMode # [Read/Write] The soft edge mode.
---@field softEdgeWidthX number # [Read/Write/Tweenable] The horizontal soft edge width.
---@field softEdgeWidthY number # [Read/Write/Tweenable] The vertical soft edge width.
---@field horizontalSoftRange number # [Read/Write/Tweenable] The horizontal soft edge range.
---@field verticalSoftRange number # [Read/Write/Tweenable] The vertical soft edge range.
---@field reverseMaskArea boolean # [Read/Write] Whether to invert the mask area.
---@field fillType EnumItem.ImageFillType # [Read/Write] The fill type of the image.
---@field fillHorizontalType EnumItem.ImageFillHorizontalType # [Read/Write] The fill direction when the fill type is Horizontal.
---@field fillVerticalType EnumItem.ImageFillVerticalType # [Read/Write] The fill direction when the fill type is Vertical.
---@field fillRadial90Type EnumItem.ImageFillRadial90Type # [Read/Write] The fill origin used when the fill type is Radial90.
---@field fillRadialType EnumItem.ImageFillRadialType # [Read/Write] The fill origin used when the fill type is Radial180 or Radial360.
---@field fillAmount NormalizedPercentage # [Read/Write/Tweenable] The normalized percentage of the image that should be revealed.
local ClientUIImageControl = {}

---Sets the image source and ID.
---@param imageSource EnumItem.ImageSource # The source to get the image asset from.
---@param imageId integer # The ID of the image asset.
function ClientUIImageControl:SetImage(imageSource, imageId) end

---Sets the horizontal and vertical soft edge width.
---
---Changes are applied even if masking and soft edge are disabled.
---@param widthX number # The horizontal soft edge width.
---@param widthY number # The vertical soft edge width.
function ClientUIImageControl:SetSoftEdgeWidth(widthX, widthY) end

---Sets the fill type to Unused.
---
---**See:**
---- [Enum.ImageFillType](https://haminpants.github.io/mililua/class/Enum.ImageFillType.html) for all image fill types.
function ClientUIImageControl:SetFillUnused() end

---Sets the fill type to Horizontal and sets the horizontal fill type and fill amount to the specified values.
---
---**See:**
---- [Enum.ImageFillHorizontalType](https://haminpants.github.io/mililua/class/Enum.ImageFillHorizontalType.html) for all horizontal image fill types.
---@param fillHorizontalType EnumItem.ImageFillHorizontalType # The horizontal fill type.
---@param fillAmount NormalizedPercentage # The normalized percentage of the image that should be revealed.
function ClientUIImageControl:SetFillHorizontal(fillHorizontalType, fillAmount) end

---Sets the fill type to Vertical and sets the vertical fill type and fill amount to the specified values.
---
---Changes are applied even if masking is disabled; masking will not be enabled if disabled when the function is called.
---
---**See:**
---- [Enum.ImageFillVerticalType](https://haminpants.github.io/mililua/class/Enum.ImageFillVerticalType.html) for all vertical image fill types.
---@param fillVerticalType EnumItem.ImageFillVerticalType # The vertical fill type.
---@param fillAmount NormalizedPercentage # The normalized percentage of the image that should be revealed.
function ClientUIImageControl:SetFillVertical(fillVerticalType, fillAmount) end

---Sets the fill type to Radial90 and sets the radial 90 fill type and fill amount to the specified values.
---
---Changes are applied even if masking is disabled; masking will not be enabled if disabled when the function is called.
---
---**See:**
---- [Enum.ImageFillRadial90Type](https://haminpants.github.io/mililua/class/Enum.ImageFillRadial90Type.html) for all radial 90-degree image fill types.
---@param fillRadial90Type EnumItem.ImageFillRadial90Type # The radial 90-degree origin point.
---@param fillAmount NormalizedPercentage # The normalized percentage of the image that should be revealed.
function ClientUIImageControl:SetFillRadial90(fillRadial90Type, fillAmount) end

---Sets the fill type to Radial180 and sets the radial fill type and fill amount to the specified values.
---
---You are currently unable to set the fill direction (clockwise or counter-clockwise).
---
---Changes are applied even if masking is disabled; masking will not be enabled if disabled when the function is called.
---
---**See:**
---- [Enum.ImageFillRadialType](https://haminpants.github.io/mililua/class/Enum.ImageFillRadialType.html) for all radial image fill types.
---@param fillRadialType EnumItem.ImageFillRadialType # The radial fill origin direction.
---@param fillAmount NormalizedPercentage # The normalized percentage of the image that should be revealed.
function ClientUIImageControl:SetFillRadial180(fillRadialType, fillAmount) end

---Sets the fill type to Radial360 and sets the radial fill type and fill amount to the specified values.
---
---You are currently unable to set teh fill direction (clockwise or counter-clockwise).
---
---Changes are applied even if masking is disabled; masking will not be enabled if disabled when the function is called.
---
---**See:**
---- [Enum.ImageFillRadialType](https://haminpants.github.io/mililua/class/Enum.ImageFillRadialType.html) for all radial image fill types.
---@param fillRadialType EnumItem.ImageFillRadialType # The radial fill starting position.
---@param fillAmount NormalizedPercentage # The normalized percentage of the image that should be revealed.
function ClientUIImageControl:SetFillRadial360(fillRadialType, fillAmount) end
