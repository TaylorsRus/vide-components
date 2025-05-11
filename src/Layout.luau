local Vide = require(game:GetService('ReplicatedStorage'):WaitForChild('Modules'):WaitForChild('Packages'):WaitForChild('Vide'))

type Source<T> = Vide.Source<T>
type Alignment = "TopLeft" | "TopMiddle" | "TopRight" | "Left" | "Middle" | "Right" | "BottomLeft" | "BottomMiddle" | "BottomRight"
type Flow = "Columns" | "Rows"
type Props = {
	Alignment: Alignment?,
	Flow: Flow?,
	Padding: Source<number>?
}

local function getAlignment(alignment: Alignment?): (Enum.VerticalAlignment, Enum.HorizontalAlignment)
	local vertical, horizontal = nil, nil

	if alignment == "TopLeft" then
		vertical = Enum.VerticalAlignment.Top
		horizontal = Enum.HorizontalAlignment.Left
	elseif alignment == "TopMiddle" then
		vertical = Enum.VerticalAlignment.Top
		horizontal = Enum.HorizontalAlignment.Center
	elseif alignment == "TopRight" then
		vertical = Enum.VerticalAlignment.Top
		horizontal = Enum.HorizontalAlignment.Right
	elseif alignment == "Left" then
		vertical = Enum.VerticalAlignment.Center
		horizontal = Enum.HorizontalAlignment.Left
	elseif alignment == "Middle" then
		vertical = Enum.VerticalAlignment.Center
		horizontal = Enum.HorizontalAlignment.Center
	elseif alignment == "Right" then
		vertical = Enum.VerticalAlignment.Center
		horizontal = Enum.HorizontalAlignment.Right
	elseif alignment == "BottomLeft" then
		vertical = Enum.VerticalAlignment.Bottom
		horizontal = Enum.HorizontalAlignment.Left
	elseif alignment == "BottomMiddle" then
		vertical = Enum.VerticalAlignment.Bottom
		horizontal = Enum.HorizontalAlignment.Center
	elseif alignment == "BottomRight" then
		vertical = Enum.VerticalAlignment.Bottom
		horizontal = Enum.HorizontalAlignment.Right
	else
		vertical = Enum.VerticalAlignment.Center
		horizontal = Enum.HorizontalAlignment.Center
	end

	return vertical, horizontal
end

return function(props: Props?)
	local props: Props = props or {}
	local verticalAlignment, horizontalAlignment = getAlignment(props.Alignment)

	return Vide.create("UiListLayout")({
		VerticalAlignment = verticalAlignment,
		HorizontalAlignment = horizontalAlignment,
		FillDirection = function()
			local flow: Flow = props.Flow or "Columns"
			return flow == "Rows" and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical
		end,
		Padding = function()
			return UDim.new(0, props.Padding and props.Padding() or 0)
		end,
	})
end
