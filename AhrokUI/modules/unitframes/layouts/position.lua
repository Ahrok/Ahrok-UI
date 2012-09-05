local T, C, L, G = unpack( Tukui )

if( C["unitframes"].enable ~= true ) then return end

--------------------------------------------------------------
-- Position
--------------------------------------------------------------
local FramePositions = CreateFrame( "Frame" )
FramePositions:RegisterEvent( "PLAYER_ENTERING_WORLD" )
FramePositions:SetScript( "OnEvent", function( self, event, addon )
	G.UnitFrames.Player:ClearAllPoints()
	G.UnitFrames.Target:ClearAllPoints()
	G.UnitFrames.TargetTarget:ClearAllPoints()
	G.UnitFrames.Pet:ClearAllPoints()
	G.UnitFrames.Focus:ClearAllPoints()
	G.UnitFrames.FocusTarget:ClearAllPoints()
	if not T.lowversion then
		G.UnitFrames.Player:SetPoint( "TOP", UIParent, "BOTTOM", -339 , 330 )
		G.UnitFrames.Target:SetPoint( "TOP", UIParent, "BOTTOM", 339 , 330 )		
		G.UnitFrames.TargetTarget:SetPoint( "TOPLEFT", G.UnitFrames.Target, "BOTTOMLEFT", -100, -85 )
		G.UnitFrames.Pet:SetPoint( "TOPRIGHT", G.UnitFrames.Player, "BOTTOMRIGHT", 100, -85 )
		G.UnitFrames.Focus:SetPoint( "TOP", UIParent, "BOTTOM", -450, 600 )
		G.UnitFrames.FocusTarget:SetPoint( "TOP", G.UnitFrames.Focus, "BOTTOM", 0 , -43 )
	else
		G.UnitFrames.Player:SetPoint( "TOP", UIParent, "BOTTOM", -130 , 270 )
		G.UnitFrames.Target:SetPoint( "TOP", UIParent, "BOTTOM", 130 , 270 )
		G.UnitFrames.TargetTarget:SetPoint( "TOPRIGHT", G.UnitFrames.Target, "BOTTOMRIGHT", -120, -85 )
		G.UnitFrames.Pet:SetPoint( "TOPRIGHT", G.UnitFrames.Player, "BOTTOMRIGHT", 120, -85 )
		G.UnitFrames.Focus:SetPoint( "TOP", UIParent, "BOTTOM", -450, 600 )
		G.UnitFrames.FocusTarget:SetPoint( "TOP", G.UnitFrames.Focus, "BOTTOM", 0 , -43 )
	end
	

	for i = 1, MAX_BOSS_FRAMES do
		G.UnitFrames["Boss" .. i]:ClearAllPoints()
		if( i == 1 ) then
			G.UnitFrames["Boss" .. i]:SetPoint( "TOP", UIParent, "BOTTOM", 600 , 800 )
		else
			G.UnitFrames["Boss" .. i]:SetPoint( "TOP", G.UnitFrames["Boss" .. i - 1], "BOTTOM", 0, -43 )
		end
	end

	for i = 1, 5 do
		G.UnitFrames["Arena" .. i]:ClearAllPoints()
		if( i == 1 ) then
			G.UnitFrames["Arena" .. i]:SetPoint( "TOP", UIParent, "BOTTOM", 600 , 800 )
		else
			G.UnitFrames["Arena" .. i]:SetPoint( "TOP", G.UnitFrames["Arena" .. i - 1], "BOTTOM", 0, -43 )
		end
	end

end )