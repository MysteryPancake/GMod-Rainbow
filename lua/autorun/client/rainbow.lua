local multiplier = 20

--[[---------------------------------------------------------
    ConsolePrintRainbow( string text )
    Prints rainbow text in the console.
-----------------------------------------------------------]]
local function ConsolePrintRainbow( text )
	
	local tab = {}
	
	for i = 1, #text do
		local col = HSVToColor( i * multiplier % 360, 1, 1 )
		table.insert( tab, col )
		local letter = string.sub( text, i, i )
		table.insert( tab, letter )
	end
	
	table.insert( tab, '\n' )
	MsgC( unpack( tab ) )
end

--[[---------------------------------------------------------
    ChatPrintRainbow( string text )
    Prints rainbow text in the chat.
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
    DrawRainbowText( string text, string font, number x, number y )
    Draws rainbow text.
-----------------------------------------------------------]]
local function DrawRainbowText( text, font, x, y )
	
	surface.SetFont( font )
	
	for i = 1, #text do
		local col = HSVToColor( i * multiplier % 360, 1, 1 )
		surface.SetTextColor( col )
		local w, h = surface.GetTextSize( string.sub( text, 1, i - 1 ) )
		surface.SetTextPos( x + w, y )
		local letter = string.sub( text, i, i )
		surface.DrawText( letter )
	end
end

--[[---------------------------------------------------------
    DrawRainbowRectOutline( number x, number y, number width, number height )
    Draws a rainbow outline of a rectangle.
-----------------------------------------------------------]]
local function DrawRainbowRectOutline( x, y, w, h )
	for i = x, x + w - 1 do -- X axis lines
		surface.SetDrawColor( HSVToColor( i * multiplier % 360, 1, 1 ) )
		surface.DrawLine( i, y, i + 1, y )
		surface.DrawLine( i, y + h - 1, i + 1, y + h )
	end
	
	for i = y, y + h - 1 do -- Y axis lines
		surface.SetDrawColor( HSVToColor( i * multiplier % 360, 1, 1 ) )
		surface.DrawLine( x, i, x, i + 1 )
		surface.DrawLine( x + w - 1, i, x + w, i + 1 )
	end
end

--[[---------------------------------------------------------
    DrawRainbowRect( bool vertical, number x, number y, number width, number height )
    Draws a rainbow rectangle.
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

--[[---------------------------------------------------------
    DrawRainbowRect2( number x, number y, number width, number height )
    Draws a different rainbow rectangle.
-----------------------------------------------------------]]
local function DrawRainbowRect2( x, y, w, h )
	for i = x, x + w - 1 do
		for j = y, y + h - 1 do
			surface.SetDrawColor( i / w * 255, j / h * 255, 255 - ( i / w * 255 ), 255 )
			surface.DrawRect( i, j, 1, 1 )
		end
	end
end
