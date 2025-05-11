local Vide = require(game:GetService('ReplicatedStorage'):WaitForChild('Modules'):WaitForChild('Packages'):WaitForChild('Vide'))

local Types = require(script.Parent.Parent:WaitForChild('Types'))
local Utils = require(script.Parent.Parent:WaitForChild('Utils'))

type Source<T> = Vide.Source<T>

local DEFAULTS = {
	Name = "Text",
	AutomaticSize = Enum.AutomaticSize.XY,
	BackgroundTransparency = 1,
	FontFace = Font.new("rbxassetid://12187365364"),
	Text = "INSERT_TEXT_HERE",
	TextColor3 = Color3.new(1, 1, 1),
	TextSize = 30,
}

return function(props: Types.VideTextProps)
	local isButton = Utils.IsButton(props)

	return Vide.create(if isButton then "TextButton" else "TextLabel")({
		Active = props.Active,
		AnchorPoint = props.AnchorPoint,
		AutomaticSize = props.AutomaticSize or DEFAULTS.AutomaticSize,
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

		FontFace = props.FontFace or DEFAULTS.FontFace,
		LineHeight = props.LineHeight,
		MaxVisibleGraphemes = props.MaxVisibleGraphemes,
		OpenTypeFeatures = props.OpenTypeFeatures,
		RichText = props.RichText,
		Text = props.Text or DEFAULTS.Text,
		TextColor3 = props.TextColor3 or DEFAULTS.TextColor3,
		TextDirection = props.TextDirection,
		TextScaled = props.TextScaled,
		TextSize = props.TextSize or DEFAULTS.TextSize,
		TextStrokeColor3 = props.TextStrokeColor3,
		TextStrokeTransparency = props.TextStrokeTransparency,
		TextTransparency = props.TextTransparency,
		TextTruncate = props.TextTruncate,
		TextWrapped = props.TextWrapped,
		TextXAlignment = props.TextXAlignment,
		TextYAlignment = props.TextYAlignment,

		(function()
			return if isButton then Utils.GetButtonProps(props) else nil
		end)(),
		table.unpack(props),
	})
end
