local Vide = require(game:GetService('ReplicatedStorage'):WaitForChild('Modules'):WaitForChild('Packages'):WaitForChild('Vide'))

type Source<T> = Vide.Source<T>

return function(props: {
	Global: Source<number>?,
	Vertical: Source<number>?,
	Horizontal: Source<number>?,
	Left: Source<number>?,
	Right: Source<number>?,
	Top: Source<number>?,
	Bottom: Source<number>?
})
	local Gloabl = props.Global
	local Vertical, Horizontal = props.Vertical, props.Horizontal
	local Left, Right, Top, Bottom = props.Left, props.Right, props.Top, props.Bottom

	if Gloabl and (Vertical or Horizontal or Left or Right or Top or Bottom) then
		warn(`Padding was passed along with other individual padding properties, defaulting to {Gloabl()} on all sides. `)
	end
	if Vertical and (Top or Bottom) then warn(`Vertical padding was passed along with Top or Bottom padding properties, defaulting to {Vertical()}`) end
	if Horizontal and (Left or Right) then
		warn(`Horizontal padding was passed along with Left or Right padding propeties. Defaulting to {Horizontal()}`)
	end

	return Vide.create("UiPadding")({
		PaddingLeft = function()
			return UDim.new(0, if Gloabl then Gloabl() elseif Horizontal then Horizontal() elseif Left then Left() else 0)
		end,
		PaddingRight = function()
			return UDim.new(0, if Gloabl then Gloabl() elseif Horizontal then Horizontal() elseif Right then Right() else 0)
		end,
		PaddingTop = function()
			return UDim.new(0, if Gloabl then Gloabl() elseif Vertical then Vertical() elseif Top then Top() else 0)
		end,
		PaddingBottom = function()
			return UDim.new(0, if Gloabl then Gloabl() elseif Vertical then Vertical() elseif Bottom then Bottom() else 0)
		end,
	})
end
