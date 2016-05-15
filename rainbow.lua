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
