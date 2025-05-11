local Vide = require(game:GetService('ReplicatedStorage'):WaitForChild('Modules'):WaitForChild('Packages'):WaitForChild('Vide'))

local Types = require(script.Parent.Parent:WaitForChild('Types'))
local Utils = require(script.Parent.Parent:WaitForChild('Utils'))

type Source<T> = Vide.Source<T>

local DEFAULTS = {
	Name = "Image",
	BackgroundTransparency = 1,
	Image = "rbxassetid://0",
}

return function(props: Types.VideImageProps)
	local isButton = Utils.IsButton(props)

	return Vide.create(if isButton then "ImageButton" else "ImageLabel")({
		Active = props.Active,
		AnchorPoint = props.AnchorPoint,
		AutomaticSize = props.AutomaticSize,
		BackgroundColor3 = props.BackgroundColor3,
		BackgroundTransparency = props.BackgroundTransparency or DEFAULTS.BackgroundTransparency,
		BorderColor3 = props.BorderColor3,
		BorderMode = props.BorderMode,
		BorderSizePixel = props.BorderSizePixel,
		ClipsDescendants = props.ClipsDescendants,
		LayoutOrder = props.LayoutOrder,
		Position = props.Position,
		Rotation = props.Rotation,
		Size = props.Size,
		SizeConstraint = props.SizeConstraint,
		Visible = props.Visible,
		ZIndex = props.ZIndex,

		Name = props.Name or DEFAULTS.Name,
		Archivable = props.Archivable,

		AncestryChanged = props.AncestryChanged,

		Selectable = props.Selectable,
		SelectionOrder = props.SelectionOrder,

		Image = props.Image or DEFAULTS.Image,
		ImageColor3 = props.ImageColor3,
		ImageTransparency = props.ImageTransparency,
		ImageRectOffset = props.ImageRectOffset,
		ImageRectSize = props.ImageRectSize,
		ScaleType = props.ScaleType,
		SliceCenter = props.SliceCenter,
		SliceScale = props.SliceScale,
		ResampleMode = props.ResampleMode,
		TileSize = props.TileSize,

		(function()
			return if isButton then Utils.GetButtonProps(props) else nil
		end)(),
		table.unpack(props),
	})
end
