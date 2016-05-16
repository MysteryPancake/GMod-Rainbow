
local multiplier = 20 -- This controls how much of the rainbow is shown with the following functions.

--[[---------------------------------------------------------
	Name: ConsolePrintRainbow
	Desc: This prints rainbow text in the console.
-----------------------------------------------------------]]
local function ConsolePrintRainbow( text )
	
	local tab = {}
	
	for i = 1, #text do
		local col = HSVToColor( i * multiplier % 360, 1, 1 )
		table.insert( tab, col )
		local letter = string.sub( text, i, i )
		table.insert( tab, letter )
	end
	
	table.insert( tab, '\n' ) -- this adds a newline to the console, but this isn't essential
	
	MsgC( unpack( tab ) )
	
end

--[[---------------------------------------------------------
	Name: ChatPrintRainbow
	Desc: This prints rainbow text in the chat.
-----------------------------------------------------------]]
local function ChatPrintRainbow( text )
	
	local tab = {}
	
	for i = 1, #text do
		local col = HSVToColor( i * multiplier % 360, 1, 1 )
		table.insert( tab, col )
		local letter = string.sub( text, i, i )
		table.insert( tab, letter )
	end

	chat.AddText( unpack( tab ) )
	
end

--[[---------------------------------------------------------
	Name: DrawRainbowText
	Desc: This draws rainbow text (using individual letters).
-----------------------------------------------------------]]
local function DrawRainbowText( text, font, x, y )

	surface.SetFont( font )

	for i = 1, #text do
		local col = HSVToColor( i * multiplier % 360, 1, 1 )
		surface.SetTextColor( col )
		local w, h = surface.GetTextSize( string.sub( text, 1, i-1 ) )
		surface.SetTextPos( x + w, y )
		local letter = string.sub( text, i, i )
		surface.DrawText( letter )
	end

end

--[[---------------------------------------------------------
	Name: DrawRainbowRectOutline
	Desc: This draws a rainbow outline of a rectangle (using individual lines). It doesn't look like a gradient.
-----------------------------------------------------------]]
local function DrawRainbowRectOutline( x, y, w, h )
	
	for i = x, x+w-1 do -- draw the x axis lines
		surface.SetDrawColor( HSVToColor( i * multiplier % 360, 1, 1 ) )
		surface.DrawLine( i, y, i+1, y )
		surface.DrawLine( i, y+h-1, i+1, y+h )
	end
	
	for i = y, y+h-1 do -- draw the y axis lines
		surface.SetDrawColor( HSVToColor( i * multiplier % 360, 1, 1 ) )
		surface.DrawLine( x, i, x, i+1 )
		surface.DrawLine( x+w-1, i, x+w, i+1 )
	end
	
end

--[[---------------------------------------------------------
	Name: DrawRainbowGradientRectOutline
	Desc: This draws a rainbow outline of a rectangle (using individual lines).
	It looks more like a gradient than DrawRainbowRectOutline, like a DrawRainbowGradientRect with a hole in its middle.
	The bVertical (bool) argument defines whether this rainbow is vertical or not.
-----------------------------------------------------------]]
local function DrawRainbowGradientRectOutline( bVertical, x, y, w, h )
	
	if bVertical then
		surface.SetDrawColor( HSVToColor( y * multiplier % 360, 1, 1 ) )
		surface.DrawLine( x, y, x+w, y )	
		
		for i = y, y+h-1 do -- draw the y axis lines
			surface.SetDrawColor( HSVToColor( i * multiplier % 360, 1, 1 ) )
			surface.DrawLine( x, i, x, i+1 )
			surface.DrawLine( x+w-1, i, x+w, i+1 )
		end
		
		surface.DrawLine( x, y+h, x+w, y+h )
	else
		surface.SetDrawColor( HSVToColor( x * multiplier % 360, 1, 1 ) )
		surface.DrawLine( x, y, x, y+h )
		
		for i = x, x+w-1 do -- draw the x axis lines
			surface.SetDrawColor( HSVToColor( i * multiplier % 360, 1, 1 ) )
			surface.DrawLine( i, y, i+1, y )
			surface.DrawLine( i, y+h-1, i+1, y+h )
		end
		
		surface.DrawLine( x+w, y, x+w, y+h )
	end
	
end

--[[---------------------------------------------------------
	Name: DrawRainbowRect
	Desc: This draws a filled rainbow rectangle using smaller rectangles. It looks like a gradient.
	The bVertical (bool) argument defines whether this rainbow is vertical or not.
-----------------------------------------------------------]]
local function DrawRainbowRect( bVertical, x, y, w, h )
	
	if bVertical then
		for i = y, y+h-1 do
			surface.SetDrawColor( HSVToColor( i * multiplier % 360, 1, 1 ) )
			surface.DrawRect( x, i, w, 1 )
		end
	else
		for i = x, x+w-1 do
			surface.SetDrawColor( HSVToColor( i * multiplier % 360, 1, 1 ) )
			surface.DrawRect( i, y, 1, h )
		end
	end

end
