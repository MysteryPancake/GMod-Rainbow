--[[---------------------------------------------------------
    DrawRainbowText( number multiplier, string str, string font, number x, number y )
    Draws rainbow text.
-----------------------------------------------------------]]
local function DrawRainbowText( multiplier, str, font, x, y )
	
	surface.SetFont( font )
	
	for i = 1, #str do
		surface.SetTextColor( HSVToColor( i * multiplier % 360, 1, 1 ) )
		local w, _ = surface.GetTextSize( string.sub( str, 1, i - 1 ) )
		surface.SetTextPos( x + w, y )
		surface.DrawText( string.sub( str, i, i ) )
	end
	
end

--[[---------------------------------------------------------
    ChatPrintRainbow( number multiplier, string str )
    Prints rainbow text in the chat.
-----------------------------------------------------------]]
local function ChatPrintRainbow( multiplier, str )
	
	local text = {}
	
	for i = 1, #str do
		table.insert( text, HSVToColor( i * multiplier % 360, 1, 1 ) )
		table.insert( text, string.sub( str, i, i ) )
	end

	chat.AddText( unpack( text ) )
	
end

--[[---------------------------------------------------------
    ConsolePrintRainbow( number multiplier, string str )
    Prints rainbow text in the console.
-----------------------------------------------------------]]
local function ConsolePrintRainbow( multiplier, str )
	
	local text = {}
	
	for i = 1, #str do
		table.insert( text, HSVToColor( i * multiplier % 360, 1, 1 ) )
		table.insert( text, string.sub( str, i, i ) )
	end
	
	table.insert( text, "\n" )
	
	MsgC( unpack( text ) )
	
end

--[[---------------------------------------------------------
    DrawRainbowRect( number multiplier, bool vertical, number x, number y, number width, number height )
    Draws a rainbow rectangle.
-----------------------------------------------------------]]
local function DrawRainbowRect( multiplier, vertical, x, y, w, h )
	if vertical then
		for i = y, y + h - 1 do
			surface.SetDrawColor( HSVToColor( i * multiplier % 360, 1, 1 ) )
			surface.DrawRect( x, i, w, 1 )
		end
	else
		for i = x, x + w - 1 do
			surface.SetDrawColor( HSVToColor( i * multiplier % 360, 1, 1 ) )
			surface.DrawRect( i, y, 1, h )
		end
	end
end

--[[---------------------------------------------------------
    DrawRainbowRect2( number x, number y, number width, number height )
    Draws an alternative rainbow rectangle.
-----------------------------------------------------------]]
local function DrawRainbowRect2( x, y, w, h )
	for i = x, x + w - 1 do
		for j = y, y + h - 1 do
			surface.SetDrawColor( ( i - x ) / w * 255, ( j - y ) / h * 255, 255 - ( ( i - x ) / w * 255 ), 255 )
			surface.DrawRect( i, j, 1, 1 )
		end
	end
end

--[[---------------------------------------------------------
    DrawRainbowRectOutline( number multiplier, number x, number y, number width, number height )
    Draws a rainbow outline of a rectangle.
-----------------------------------------------------------]]
local function DrawRainbowRectOutline( multiplier, x, y, w, h )
	
	for i = x, x + w - 1 do
		surface.SetDrawColor( HSVToColor( i * multiplier % 360, 1, 1 ) )
		surface.DrawLine( i, y, i + 1, y )
		surface.DrawLine( i, y + h - 1, i + 1, y + h )
	end
	
	for i = y, y + h - 1 do
		surface.SetDrawColor( HSVToColor( i * multiplier % 360, 1, 1 ) )
		surface.DrawLine( x, i, x, i + 1 )
		surface.DrawLine( x + w - 1, i, x + w, i + 1 )
	end
	
end
