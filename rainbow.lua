local multiplier = 20 -- this controls how much of the rainbow is shown with the following functions

local function ConsolePrintRainbow( text ) -- this prints rainbow text in the console
	local tab = {}
	for i = 1, #text do
		local c = HSVToColor( i * multiplier % 360, 1, 1 )
		table.insert( tab, c )
		local letter = string.sub( text, i, i )
		table.insert( tab, letter )
	end
	table.insert( tab, '\n' ) -- this adds a newline to the console, but it isn't really necessary, so you can remove it
	MsgC( unpack( tab ) )
end

local function DrawRainbowOutlinedRect( x, y, w, h ) -- this draws a rainbow outline of a rectangle (using individual lines, ugh)
	for i = x, x+w-1 do -- draw the x axis lines
		surface.SetDrawColor( HSVToColor( i * multiplier % 360, 1, 1 ) )
		surface.DrawLine( i, y, i+1, y )
		surface.DrawLine( i, y+h, i+1, y+h )
	end
	for i = y, y+h-1 do -- draw the y axis lines
		surface.SetDrawColor( HSVToColor( i * multiplier % 360, 1, 1 ) )
		surface.DrawLine( x, i, x, i+1 )
		surface.DrawLine( x+w, i, x+w, i+1 )
	end
end
