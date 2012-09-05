local T, C, L, G = unpack( Tukui )

if( C["unitframes"].enable ~= true ) then return end
--------------------------------------------------------------
-------------------------- Player ---------------------------
--------------------------------------------------------------
do

	do
		G.UnitFrames.Player:SetBackdrop( nil )
		G.UnitFrames.Player:SetBackdropColor( 0, 0, 0 )
		G.UnitFrames.Player.shadow:Kill()
		G.UnitFrames.Player.panel:Kill()
	end
	
--------------------------------------------------------------
-- panel may i use it later
--------------------------------------------------------------
	--do
	--	G.UnitFrames.Player.panel:SetHeight(17)
	--	G.UnitFrames.Player.panel:SetFrameLevel(2)
	--	G.UnitFrames.Player.panel:SetFrameStrata("MEDIUM")
	--end
	
--------------------------------------------------------------
-- health
--------------------------------------------------------------	
	
	do
	-- Healthbar
	G.UnitFrames.Player.Health:SetHeight(23)
	G.UnitFrames.Player.Health:Point("TOPLEFT", 0, -16)
	G.UnitFrames.Player.Health:Point("TOPRIGHT", 0, -16)
	G.UnitFrames.Player.Health:SetStatusBarTexture(C["media"].normTex)
	G.UnitFrames.Player.Health:SetFrameLevel( 4 )
	G.UnitFrames.Player.Health:CreateBackdrop("Default")
	G.UnitFrames.Player.Health.bg:SetVertexColor( 0.6, 0.6, 0.6 )
	--Healthbar Unicolor
		if( C["unitframes"].unicolor == true ) then
			G.UnitFrames.Player.Health.colorTapping = false
			G.UnitFrames.Player.Health.colorDisconnected = false
			G.UnitFrames.Player.Health.colorClass = false
			G.UnitFrames.Player.Health:SetStatusBarColor(.3, .3, .3, 1)
			G.UnitFrames.Player.Health.bg:SetTexture( 0.6, 0.6, 0.6 )
			G.UnitFrames.Player.Health.bg:SetVertexColor(unpack(C["unitframes"].healthBgColor))
		else
			G.UnitFrames.Player.Health.colorDisconnected = true
			G.UnitFrames.Player.Health.colorTapping = true
			G.UnitFrames.Player.Health.colorClass = true
			G.UnitFrames.Player.Health.colorReaction = true
		end

	end
--------------------------------------------------------------
-- Power
--------------------------------------------------------------		
	do
	-- Powerbar
	G.UnitFrames.Player.Power:Height(4)
	G.UnitFrames.Player.Power:Point("TOPLEFT", G.UnitFrames.Player.Health, "BOTTOMLEFT", 0, -5)
	G.UnitFrames.Player.Power:Point("TOPRIGHT", G.UnitFrames.Player.Health, "BOTTOMRIGHT", 0, -5)
	G.UnitFrames.Player.Power:SetStatusBarTexture(C["media"].normTex)
	G.UnitFrames.Player.Power:CreateBackdrop("Default")
	end	
--------------------------------------------------------------
-- Power & Health Text
--------------------------------------------------------------		
	do
	-- Health Text
	G.UnitFrames.Player.Health.value:ClearAllPoints()
	G.UnitFrames.Player.Health.value = T.SetFontString( G.UnitFrames.Player.Health,unpack(T.Fonts.uGeneral.setfont))
	G.UnitFrames.Player.Health.value:Point( "RIGHT", G.UnitFrames.Player.Health, "RIGHT", -4, 1 )
	-- Power Text
	G.UnitFrames.Player.Power.value:ClearAllPoints()
	G.UnitFrames.Player.Power.value = T.SetFontString( G.UnitFrames.Player.Health,unpack(T.Fonts.uGeneral.setfont))
	G.UnitFrames.Player.Power.value:Point( "LEFT", G.UnitFrames.Player.Health, "LEFT", 4, 1 )	
	end
--------------------------------------------------------------
-- portraits
--------------------------------------------------------------
	do
		if C["unitframes"].charportrait == true then
			G.UnitFrames.Player.Portrait:ClearAllPoints()
			G.UnitFrames.Player.Portrait:SetAllPoints( G.UnitFrames.Player.Health )
			G.UnitFrames.Player.Portrait:SetAlpha( 0.2 )
			G.UnitFrames.Player.Portrait.SetAlpha = T.dummy
			G.UnitFrames.Player.Health:ClearAllPoints()
			G.UnitFrames.Player.Health:SetPoint( "TOPLEFT", 0, 0 )
			G.UnitFrames.Player.Health:SetPoint( "TOPRIGHT" )
			G.UnitFrames.Player.Portrait:SetFrameLevel( G.UnitFrames.Player.Health:GetFrameLevel()+1)
		end
	end
--------------------------------------------------------------
-- icons & Warnings
--------------------------------------------------------------	
	do
	--the combat icon
	G.UnitFrames.Player.Combat:Size( 19 )
	G.UnitFrames.Player.Combat:ClearAllPoints()
	G.UnitFrames.Player.Combat:SetPoint( "CENTER", 0, 0 )
	G.UnitFrames.Player.Combat:SetVertexColor( 0.69, 0.31, 0.31 )
	-- low mana warnings
	G.UnitFrames.Player.FlashInfo:ClearAllPoints()
	G.UnitFrames.Player.FlashInfo:SetAllPoints( G.UnitFrames.Player.Health )
	G.UnitFrames.Player.FlashInfo:SetFrameLevel( G.UnitFrames.Player.Health:GetFrameLevel() + 2 )

	G.UnitFrames.Player.FlashInfo.ManaLevel:ClearAllPoints()
	G.UnitFrames.Player.FlashInfo.ManaLevel:SetPoint( "CENTER", 0, 1 )
	G.UnitFrames.Player.FlashInfo.ManaLevel:SetFont(unpack(T.Fonts.uGeneral.setfont))
	-- combat feedback
		if( C["unitframes"].combatfeedback == true ) then
			G.UnitFrames.Player.CombatFeedbackText:SetFont(unpack(T.Fonts.uGeneral.setfont))
		end
	-- druidmana
		if( T.myclass == "DRUID" ) then
			G.UnitFrames.Player.DruidManaText:SetFont(unpack(T.Fonts.uGeneral.setfont))
		end
		
	--------------------------------------------------------------
	-- Exp / Rep Bar's
	--------------------------------------------------------------		
	do
	if T.level ~= MAX_PLAYER_LEVEL then
	-- The EXP Bar
	G.UnitFrames.Player.Experience:ClearAllPoints()
	G.UnitFrames.Player.Experience:Point("TOPLEFT", G.UnitFrames.Player.Power)
	G.UnitFrames.Player.Experience:Point("BOTTOMRIGHT", G.UnitFrames.Player.Power)
	-- resting Icon
	G.UnitFrames.Player.Resting:Size(25)
	G.UnitFrames.Player.Resting:ClearAllPoints()
	G.UnitFrames.Player.Resting:SetPoint( "Left", G.UnitFrames.Player.power, 0, 0 )
	end
	if T.level == MAX_PLAYER_LEVEL then
	-- The reputation bar
	G.UnitFrames.Player.Reputation:ClearAllPoints()
	G.UnitFrames.Player.Reputation:Point("TOPLEFT", G.UnitFrames.Player.Power)
	G.UnitFrames.Player.Reputation:Point("BOTTOMRIGHT", G.UnitFrames.Player.Power)
	end
		
	
	
	-- PvP Status
	G.UnitFrames.Player.Status:ClearAllPoints()
	G.UnitFrames.Player.Status:SetAllPoints( G.UnitFrames.Player.Health )
	G.UnitFrames.Player.Status:SetFont(unpack(T.Fonts.uGeneral.setfont))
	G.UnitFrames.Player.Status:SetText("[PvP]")
	--some space to add more icons/warnings
	
	
	
	--
	end
--------------------------------------------------------------
-- castbar
--------------------------------------------------------------	
	do
	-- the castbar it self
		if (C["unitframes"].unitcastbar == true) then
		G.UnitFrames.Player.Castbar:ClearAllPoints()
		G.UnitFrames.Player.Castbar:SetHeight(13)
		G.UnitFrames.Player.Castbar:Point("TOPLEFT", G.UnitFrames.Player.Power, "BOTTOMLEFT", 0, -5)
		G.UnitFrames.Player.Castbar:Point("TOPRIGHT", G.UnitFrames.Player.Power, "BOTTOMRIGHT", 0, -5)
		G.UnitFrames.Player.Castbar:SetStatusBarTexture(C["media"].normTex)
		G.UnitFrames.Player.Castbar:CreateBackdrop("Default")
		G.UnitFrames.Player.Castbar.bg:SetVertexColor( 0.05, 0.05, 0.05, .2 )
		end
	-- the castbar icon
		if C["unitframes"].cbicons == true then
			G.UnitFrames.Player.Castbar.button:ClearAllPoints()
			G.UnitFrames.Player.Castbar.button:SetPoint( "RIGHT", G.UnitFrames.Player.Castbar, "LEFT", -5, 0 )
			G.UnitFrames.Player.Castbar.button:Size( 17)
		else
			G.UnitFrames.Player.Castbar:SetWidth(C.castbar.playerwidth)
		end
		-- Castbar text
		G.UnitFrames.Player.Castbar.PostCastStart = T.PostCastStart
		G.UnitFrames.Player.Castbar.PostChannelStart = T.PostCastStart

		G.UnitFrames.Player.Castbar.Time = T.SetFontString( G.UnitFrames.Player.Castbar,unpack(T.Fonts.uGeneral.setfont))
		G.UnitFrames.Player.Castbar.Time:Point( "RIGHT", G.UnitFrames.Player.Castbar, "RIGHT", -4, 0 )

		G.UnitFrames.Player.Castbar.Text = T.SetFontString( G.UnitFrames.Player.Castbar,unpack(T.Fonts.uGeneral.setfont))
		G.UnitFrames.Player.Castbar.Text:Point( "LEFT", G.UnitFrames.Player.Castbar, "LEFT", 4, 0 )
			
	end
end

	------------------------------
	-- size
	------------------------------
	do
		G.UnitFrames.Player:Size( 250, 30 )
	end
end