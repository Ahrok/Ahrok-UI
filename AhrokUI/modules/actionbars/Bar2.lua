local T, C, L, G = unpack( Tukui )

if( C["actionbar"].enable ~= true ) then return end
---------------------------------------------------------------------------
-- setup Bar 2 as Top Bar
---------------------------------------------------------------------------
local bar = TukuiBar2
MultiBarBottomLeft:SetParent( bar )

for i = 1, 12 do
	local b = _G["MultiBarBottomLeftButton" .. i]
	local b2 = _G["MultiBarBottomLeftButton" .. i - 1]
	b:SetSize( T.buttonsize, T.buttonsize )
	b:ClearAllPoints()
	b:SetFrameStrata( "BACKGROUND" )
	b:SetFrameLevel( 15 )
		if( i == 1 ) then
			b:Point( "BOTTOM", ActionButton1, "TOP", 0, T.buttonspacing )
		else
			b:Point( "LEFT", b2, "RIGHT", T.buttonspacing, 0 )
		end
	end

RegisterStateDriver(bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show")