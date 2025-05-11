local Types = require(script.Parent.Parent:WaitForChild('Types'))
local Vide = require(game:GetService('ReplicatedStorage'):WaitForChild('Modules'):WaitForChild('Packages'):WaitForChild('Vide'))

local source = Vide.source

local function isScrollable(props: Types.VideScrollingFrameProps)
	return props.AutomaticCanvasSize
		or props.BottomImage
		or props.CanvasPosition
		or props.CanvasSize
		or props.ElasticBehavior
		or props.HorizontalScrollBarInset
		or props.MidImage
		or props.ScrollBarImageColor3
		or props.ScrollBarImageTransparency
		or props.ScrollBarThickness
		or props.ScrollingDirection
		or props.ScrollingEnabled
		or props.TopImage
		or props.VerticalScrollBarInset
		or props.VerticalScrollBarPosition
end

return function(props: Types.VideScrollingFrameProps)
	local isScrollable = isScrollable(props)
	if isScrollable then
		props.ScrollBarImageTransparency = props.ScrollBarImageTransparency or source(1)
		props.ScrollBarThickness = props.ScrollBarThickness or source(0)
		props.CanvasSize = props.CanvasSize or source(UDim2.fromScale(0, 0))
		props.AutomaticCanvasSize = props.AutomaticCanvasSize or source(Enum.AutomaticSize.XY)
	end

	return Vide.create(if isScrollable then "ScrollingFrame" else "Frame")({
		Name = props.Name or source("Container"),
		Archivable = props.Archivable or source(true),

		AncestryChanged = props.AncestryChanged or nil,
		Size = props.Size or source(UDim2.new()),
		Active = props.Active or source(true),

		AnchorPoint = props.AnchorPoint or source(Vector2.new(0, 0)),
		AutomaticSize = props.AutomaticSize or source(Enum.AutomaticSize.XY),

		BackgroundColor3 = props.BackgroundColor3 or source(Color3.fromRGB(255, 255, 255)),
		BackgroundTransparency = props.BackgroundTransparency or source(1),

		BorderColor3 = props.BorderColor3 or source(Color3.fromRGB(0, 0, 0)),
		BorderMode = props.BorderMode or source(Enum.BorderMode.Inset),
		BorderSizePixel = props.BorderSizePixel or source(1),

		ClipsDescendants = props.ClipsDescendants or source(false),

		LayoutOrder = props.LayoutOrder or source(0),

		Position = props.Position or source(UDim2.new()),
		Rotation = props.Rotation or source(0),

		Selectable = props.Selectable or source(false),
		SelectionOrder = props.SelectionOrder or source(0),

		SizeConstraint = props.SizeConstraint or source(Enum.SizeConstraint.RelativeXY),
		Visible = props.Visible or source(true),
		ZIndex = props.ZIndex or source(1),

		Changed = props.Changed or source(nil),
		table.unpack(props),
	})
end
